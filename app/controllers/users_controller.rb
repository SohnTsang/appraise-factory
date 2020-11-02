class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  def show
  end
  def create
    @user = User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
