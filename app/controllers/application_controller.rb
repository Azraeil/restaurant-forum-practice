class ApplicationController < ActionController::Base
  # protect_from_forgery 用途待確認，記得只要不是 GET ，其他 VERB 一律要求要有 token，可避免某種攻擊
  protect_from_forgery with: :exception

  # add devise before filter to add parameters to User
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 所有 action 先進行登入驗證才能執行
  before_action :authenticate_user!

  # Devise 客製化屬性
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
