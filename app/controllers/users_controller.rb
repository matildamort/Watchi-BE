class UsersController < ApplicationController
 
#create new user
    def create
        @user = User.create(user_params) #Creates a new user with the params
        if @user.save #if the new user is able to save display success message
            render json: @user, status: :created
        else #if the new user is not able to save display error message
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.permit(:user).permit(:username, :email, :firstname, :lastname:password, :password_confirmation)
    end

end
