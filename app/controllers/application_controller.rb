class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper

  private
  def logged_in_admin
    unless logged_in?
      flash[:danger] = t "admin.error_log"
      redirect_to login_url
    end
  end
end
