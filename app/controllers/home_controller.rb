class HomeController < ApplicationController
  def index
    redirect_to user_signed_in? ? user_path : new_user_session_path
  end
end
