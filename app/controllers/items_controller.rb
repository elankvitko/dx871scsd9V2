class ItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @item = Item.new
  end

  def create
    @item = Item.new( item_params )

    if @item.save
      redirect_to new_item_path order_id: @item.order_id
    end
  end

  def edit
    @item = Item.find_by( id: params[ 'id' ] )

    if request.xhr?
      @item.update_attributes( priority: params[ 'priority' ] )
    end
  end

  def update
    @item = Item.find_by( id: params[ 'id' ] )
    @item.update_attributes( status: params[ 'item' ][ 'status' ] )
    @order = @item.order

    ChangeMailer.new_change( @order ).deliver_now

    redirect_to order_path( @order )
  end

  private

    def item_params
      params.require( :item ).permit( :order_id, :store, :name, :model_number, :status, :priority, :price_range, :shipping_time )
    end
end
