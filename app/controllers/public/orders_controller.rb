class Public::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save

    @cart_items = CartItem.where(customer_id: current_customer)
    @cart_items.each do |item|
      
    end
    redirect_to complete_orders_path
    
    binding.pry
    #明日ここから
  end

  def show
    if params[:id]
      redirect_to new_order_path
    end

  end

  def confirm
    @order = Order.new(order_params)
    @select_address = params[:order][:select_address]
    #自分の住所を選んだ時
    if @select_address == '0'
      @order.delivery_postcode = current_customer.post_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    #既存の住所を選んだ時
    elsif @select_address == '1'
      @address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.delivery_postcode = @address.post_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    end
    #既存の住所を選んだ時,配送先の情報が入っているか確認する
    if @order.delivery_postcode.presence && @order.delivery_address.presence && @order.delivery_name.presence
      @cart_items = CartItem.where(customer_id: current_customer)
      @temp_sum = 0
      render :confirm
    else
      redirect_to new_order_path
    end
  end

  def complete
  end

  private

  def order_params
      params.require(:order).permit(:customer_id, :shipping_fee, :order_status, :total_price, :payment, :delivery_postcode, :delivery_address, :delivery_name)
  end
end
