class UsersController < ApplicationController
 
#create new user
    def create
        @user = User.create(user_params) #Creates a new user with the params
        if @user.save #if the new user is able to save display success message
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {@username :@user.username, jwt: auth_token.token}, status: :created
        else #if the new user is not able to save display error message
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    #login user
    def login
        @user = User.find_by(email: params[:email]) 
        if @user && @user.authenticate(params[:password])
            auth_token = Knock::AuthToken.new payload: {sub: @user.id}
            render json: {@username :@user.username, jwt: auth_token.token}, status: 200

        else
            render json: {error: "Invalid email or password"}, status: :unauthorized
        end
    end

    def signout
        render json: {message: "You have been signed out"}, status: :ok
    end

    private
    def user_params
        params.permit(:user).permit(:username, :email, :firstname, :lastname, :password, :password_confirmation)
    end

end
