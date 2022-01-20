class Item < ApplicationRecord
  belongs_to :genre

  attachment :image
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true, presence:true
  validates :introduction, :price, :sales_status, presence: true
  
  belongs_to :cart_items

  # 消費税の計算 roundで小数点の切り上げ
  def add_tax_price
        (self.price * 1.10).round
  end
end
