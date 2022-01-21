class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer)
  end

  def create
    
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location:root_path)
  end

  def destroy
    
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end

end
