class ItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = nil

    if params[ 'order_id' ]
      @order = Order.find( params[ 'order_id' ] )
    else
      @order = Order.last
    end

    @item = Item.new
  end

  def create
    @item = Item.new( item_params )

    if !params[ 'nickname' ].empty?
      Order.find( params[ 'item' ][ 'order_id' ] ).update_attributes( nickname: params[ 'nickname' ] )
    end

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
      params.require( :item ).permit( :order_id, :store, :name, :model_number, :status, :priority, :price_range, :color, :shipping_time )
    end
end
