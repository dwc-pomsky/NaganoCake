class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @oder = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  def update
    @order = Order.find(params[:id])
    @orders.update(order_params)
    @orders_items = @oder.order_items

      if @order.order_status == "入金確認"
        #　紐付く注文ステータスが入金確認になったら
        @order_items.each do |order_item|
        # 注文商品の各商品の
          order_item.production_status = "制作待ち"
          # 制作ステータスを制作待ちにして
          order_item.save
          # 保存する
        end
      end
    redirect_to admin_order_path(@order)

  end

  private

  def order_params
    params.require(:oder).permit(:order_status)
  end
end
