class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :update]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit

    end

    def update
        if @user.update(user_params)
            redirect_to root_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    private

    def find_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end
end
