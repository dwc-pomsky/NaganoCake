class Item < ApplicationRecord
  belongs_to :genre

  attachment :image

  # 消費税の計算 roundで小数点の切り上げ
  def add_tax_price
        (self.price * 1.10).round
  end
end
