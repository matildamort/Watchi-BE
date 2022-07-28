class UsersController < ApplicationController

 before_action :is_admin, only: [:show, :edit, :update]
 before_action :is_admin_or_user, only: [:edit, :update]

#create new user
def create
    @user = User.create(user_params) #Creates a new user with the params

    if @user.errors.any?
        render json: @user.errors, status: :unprocessable_entity
    else
        auth_token = Knock::AuthToken.new payload: {sub: @user.id}
        print auth_token
        render json: {username: @user.username, jwt: auth_token.token }, status: :created
    end
end

def index
    @users = User.all
    render json: @users
end

#Finds the current user to be able to have user details displayed in the 'my account' section. 
    def current_user
        @current_user ||= User.find(payload['sub']) if payload
    end


    def login
        @user = User.find_by_email(params[:email]) 
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            print auth_token
            render json: {username: @user.username, jwt: auth_token.token}, status: 200

        else
            render json: {error: "Invalid email or password"}, status: :unauthorized
        end
    end
    

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        render json: {message: "User deleted"}, status: :ok
    end

    # def signout
    #     render json: {message: "You have been signed out"}, status: :ok
    # end

    private
    def user_params
        params.permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
    end

    #prevent user from action if not admin
    def is_admin
        if !current_user.admin
            render json: {error: "You are not authorized to perform this action"}, status: :unauthorized
            redirect_back(fallback_location: root_path)
        end
    end
end
