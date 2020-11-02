class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:user_page]
  def index
  end
  def user_page
    redirect_to home_index_path unless user_signed_in?
  end
end
