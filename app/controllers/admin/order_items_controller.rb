class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
      @order = OrderItems.find(params[:id])
      @order.update(order_items_params)
      redirect_to admin_order_path(@order)
  end 
  
  private
  
  def order_items_params
      params.require(:order_items).permit(:production_status)
  end
end
