class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @oder = Order.find(params[:id])
    @order_items = @order.order_items.all
  end
  
  def update
    @orders = Order.find(params[:id])
    if @orders.update(order_params) #注文ステータスの
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end
  
  private
  
  def order_params
    params.require(:oder).permit(:order_status)
  end
end
