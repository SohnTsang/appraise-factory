class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:user_page]
  def index
    redirect_to home_user_page_path if user_signed_in?
  end
  def user_page
    redirect_to home_index_path unless user_signed_in?
  end
  
end
