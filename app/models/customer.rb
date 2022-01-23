class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #バリデーションの設定
  validates :last_name, :first_name, :kana_last_name, :kana_first_name,
            :post_code, :address, :telephone, presence: true
  validates :email, uniqueness: true
  has_many :delivery_addresses, dependent: :destroy
  #has_one :cart_items

  #customerがcart_itemの所有者
  has_many :cart_item, dependent: :destroy
  has_many :order, dependent: :destroy

  def full_my_address
    '〒' + post_code + ' ' + address
  end
end
