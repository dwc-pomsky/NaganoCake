class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # @orders = Oder.page(params[:page]).reverse_order.per(10)
  end
end
