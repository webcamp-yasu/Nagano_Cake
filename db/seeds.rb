# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  id: 1,
  email: 'admin@gmail.com',
  password: 'password'
)

15.times do |n|
  Customer.create!(
    last_name: "鈴木",
    first_name: "太郎#{n + 1}",
    last_name_kana: "スズキ",
    first_name_kana: "タロウ",
    email: "test#{n + 1}@test.com",
    postal_code: "0001111",
    address: "東京都渋谷区11111",
    phone_number: "00011112222",
    password: "password"
  )
end


Genre.create!(
 name: 'ケーキ'
 )

Customer.create!(
    last_name: 'テスト姓',
    first_name: 'テスト名',
    last_name_kana: 'テスト',
    first_name_kana: 'ナマエ',
    postal_code: '1111111',
    address: '東京都新宿区',
    phone_number: '11111111',
    email: 'test@customer',
    is_deleted: false,
    password: '111111'
	)

Order.create!([
	{
 	id: 1,
 	customer_id: 1,
 	postage: '800',
 	billing_amount: '2000',
 	payment_method: 0,
	postal_code: '1111111',
 	address: "東京都目黒区",
 	address_name: 'TestA',
 	status: 0,
 	created_at: "2020/08/19 15:23"
   } ,
   {
	id: 2,
	customer_id: 1,
	postage: '800',
 	billing_amount: '2000',
 	payment_method: 0,
 	postal_code: '1111111',
 	address: "東京都渋谷区",
 	address_name: 'TestB',
 	status: 0,
 	created_at: "2020/08/19 20:23"
   }
   ])

