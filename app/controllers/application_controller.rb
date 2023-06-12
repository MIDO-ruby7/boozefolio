class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
