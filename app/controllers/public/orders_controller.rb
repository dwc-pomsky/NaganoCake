class Public::OrdersController < ApplicationController
  def new
    @orders = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
  end
  
  def create
  end
  
  def complete
  end
  
  def index
  end
  
  def show
  end
  
end
