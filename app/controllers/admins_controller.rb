class AdminsController < ApplicationController
  before_action :logged_in_admin

  def show
    unless @current_admin
      flash[:danger] = t "admin.error_log"
      redirect_to root_url
    end
  end

  def edit
  end

  def update
    if @current_admin.authenticate params[:admin][:old_password]
      if @current_admin.update_attributes select_params
        flash[:success] = t "admin.success"
        redirect_to admin_path
      else
        flash[:danger] = t "admin.fail"
        render :edit
      end
    else
      flash[:danger] = t "admin.fail"
      render :edit
    end
  end

  private
  def admin_params
    params.require(:admin).permit :name, :email, :old_password, :password,
      :password_confirmation
  end

  def select_params
    if admin_params[:password] == ""
      params.require(:admin).permit :name, :email
    elsif admin_params[:password] == admin_params[:password_confirmation]
      params.require(:admin).permit :name, :email, :password
    end
  end
end
