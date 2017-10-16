module EacUsersSupport
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def edit
      @user = current_user
    end

    def update_password
      @user = User.find(current_user.id)
      if @user.update(user_params)
        sign_in @user, bypass: true
        redirect_to main_app.root_path
      else
        render 'edit'
      end
    end

    private

    def user_params
      # NOTE: Using `strong_parameters` gem
      params.require(:user).permit(:password, :password_confirmation)
    end
  end
end
