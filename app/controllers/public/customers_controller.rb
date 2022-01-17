class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update
    redirect_to customers_mypage_path
  end

  def unsubscribe
  end

  def withdraw
  end
end
