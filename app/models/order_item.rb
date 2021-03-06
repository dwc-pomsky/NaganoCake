class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def add_tax_price_on_purchase
    (self.price_on_purchase * 1.10).round
  end

  enum production_status: { 着手不可:0, 制作待ち:1, 製作中:2, 制作完了:3 }

end
