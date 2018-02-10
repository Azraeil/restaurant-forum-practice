class ApplicationController < ActionController::Base
  # protect_from_forgery 用途待確認，記得只要不是 GET ，其他 VERB 一律要求要有 token，可避免某種攻擊
  protect_from_forgery with: :exception
  
  # 所有 action 先進行登入驗證才能執行
  before_action :authenticate_user!
end
