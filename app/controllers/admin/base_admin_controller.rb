class Admin::BaseAdminController < ApplicationController
  before_action :authenticate_admin

  private
  # for admin authentication
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end
end
