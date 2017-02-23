class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new( address_params )

    if @address.save
      redirect_to user_path( current_user )
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
      params.require( :address ).permit( :user_id, :address, :city, :state, :zip, :nickname )
    end
end
