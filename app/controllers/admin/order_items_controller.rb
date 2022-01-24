class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
      @order_item = OrderItems.find(params[:id])
      @order = @order_item.order
      @order_items = @order.order_item
      @order.update(order_items_params)

      if @order_items.where(production_status: "製作中").count >= 1
        # 紐付く注文商品の制作ステータスが１つでも製作中になったら
        @order.order_status = "製作中"
        # 注文ステータスを製作中にして
        @order.save
        # 保存する
      end

      if @order.order_item.count == @order_item.where(production_status: "制作完了").count
        # 紐付く注文商品の制作ステータスが全て制作完了になったら
        @order.order_status = "発送準備中"
        # 注文ステータスを発送準備中にして
        @order.save
        # 保存する
      end

      redirect_to admin_order_path(@order)
  end

  private
  def order_items_params
      params.require(:order_items).permit(:production_status)
  end
end
