class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    #カートに追加するため
    @cart_items = CartItem.new
  end

  private

  def item_params
    params.require(:item).permit(:title,:price)
  end

end
