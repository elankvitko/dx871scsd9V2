class UsersController < ApplicationController
  def show
    @user = current_user
    @orders = @user.items_shipped
    @addresses = @user.addresses
  end
end
