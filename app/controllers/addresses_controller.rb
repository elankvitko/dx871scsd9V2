class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new( address_params )

    if @address.save
      redirect_to controller: 'users', action: 'show', id: current_user.id, show_address: true
    end
  end

  def update
    @address = Address.find( params[ 'address' ] )
    @addresses = Address.all

    @addresses.each do | address |
      if address == @address
        @address.update_attributes( default: true )
      else
        address.update_attributes( default: false )
      end
    end
  end

  def destroy
    if request.xhr?
      @address = Address.find( params[ 'address' ] )
      @address.destroy
    end
  end

  private
    def address_params
      params.require( :address ).permit( :user_id, :address, :city, :state, :zip, :nickname, :order_id )
    end
end
