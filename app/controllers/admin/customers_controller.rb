class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :fullname , :email , :is_deleted)
  end

end
