class Public::DeliveryAddressesController < ApplicationController
  def index
    @new_delivery_address = DeliveryAddress.new
    @delivery_addresses = DeliveryAddress.all
  end

  def create
    @delivery_addresses = DeliveryAddress.new(delivery_params)
    @delivery_addresses.customer_id = current_customer.id
    @delivery_addresses.save
    redirect_back(fallback_location:root_path)
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.update(delivery_params)
    redirect_to delivery_addresses_path
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_back(fallback_location:root_path)
  end

  private

  def delivery_params
    params.require(:delivery_address).permit(:post_code, :address, :name)
  end

end
