class UsersController < ApplicationController
  def index
    @shops = Shop.all
  end
end
