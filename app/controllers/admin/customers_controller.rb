class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.page(params[:page]).reverse_order
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name , :email , :is_deleted , :last_name , :first_name , :kana_last_name , :kana_first_name , :post_code , :address , :telephone , :email , :is_deleted)
  end

end
