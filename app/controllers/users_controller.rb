class UsersController < ApplicationController
  def show
    @user = current_user
    @orders = @user.items_shipped
  end
end
