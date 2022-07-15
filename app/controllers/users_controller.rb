class UsersController < ApplicationController
 
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

    def signout
        render json: {message: "You have been signed out"}, status: :ok
    end

 

    private
    def user_params
        params.permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
    end

end
