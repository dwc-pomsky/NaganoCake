class Public::CustomersController < ApplicationController
  #ログインチェックを行う
  before_action :ensure_correct_customer

  def show
  end

  def edit
    #ログイン中のユーザーを取得
    @customer = current_customer
  end

  def update
    #ログイン中のユーザーを取得
    @customer = current_customer
    #ログイン中のユーザーの情報更新
    @customer.update
    #マイページに戻る
    redirect_to customers_mypage_path
  end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    #退会フラグをtrueにして保存
    @customer.is_deleted = true
    @customer.save
    #マイページに戻る
    redirect_to customers_mypage_path
  end

  private
  def ensure_correct_customer
    #current_customerが取得できない場合
    if current_customer == nil
      #ログイン画面に飛ばす
      redirect_to new_customer_session_path
    end
  end
end
