class OrderItem < ApplicationRecord
   belongs_to :order
   belongs_to :item

  def add_tax_price
    (self.price * 1.10).round
  end

  enum production_status: { "着手不可":0, "制作待ち":1, "製作中":2, "制作完了":3 }

end
