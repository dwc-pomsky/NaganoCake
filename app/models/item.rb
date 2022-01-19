class Item < ApplicationRecord
  belongs_to :genre

  attachment :image
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true, presence:
  validates :introduction, :price, :sales_status, :image, :genre, presence: true

  # 消費税の計算 roundで小数点の切り上げ
  def add_tax_price
        (self.price * 1.10).round
  end
end
