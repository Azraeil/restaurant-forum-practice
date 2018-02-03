class RestaurantsController < ApplicationController
  # for login athentication by devise
  before_action :authenticate_user!

  def index
  end
end
