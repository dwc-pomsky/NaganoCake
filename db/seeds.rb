# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'test@test.com',
  password: 'testpass',
  )

Customer.create!(
  email: 'test@test.com',
  password: 'testpass',
  last_name: '令和',
  first_name: '道子',
  kana_last_name: 'レイワ',
  kana_first_name: 'ミチコ',
  post_code: '0000000',
  address: '東京都渋谷区代々木神園町0-0',
  telephone: '00000000000'
)

DeliveryAddress.create!(
  customer_id: '1',
  post_code: '1111111',
  address: '東京都渋谷区代々木神園町0-0-1',
  name: '令和太郎'
)

Genre.create!(
  name: 'ケーキ'
)

5.times do |n|
  item = Item.create!(
    name: 'テスト商品' + n.to_s,
    introduction: '商品用の説明文です',
    price: '500',
    genre_id: '1',
    image: File.open('./app/assets/images/sweets_pancake.png')
  )
end

CartItem.create!(
  item_id: '1',
  customer_id: '1',
  amount: '1'
)
