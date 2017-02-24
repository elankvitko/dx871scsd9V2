class UsersController < ApplicationController
  def show
    @user = current_user
    @orders = @user.items_shipped
    @addresses = @user.addresses
    @default = []

    @addresses.each do | address |
      @default << address if address.default
    end
  end
end
