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

Genre.create!(
 name: 'プリン'
)

Genre.create!(
 name: '焼き菓子'
)

Genre.create!(
 name: 'キャンディ'
)

Item.create!(
  name: "ベリーシフォンケーキ",
  detail: "ストロベリー、ブルーベリー、チェリーの3種類のベリーがのった定番のシフォンケーキとなっております。",
  price: 600,
  genre_id: 1,
  is_active: true,
  image: open("./app/assets/images/BerryCake.png")
)

Item.create!(
  name: "ナガノマカロン",
  detail: "4色の当店特製のマカロンセットとなっております。",
  price: 600,
  genre_id: 3,
  is_active: true,
  image: open("./app/assets/images/Macaron.png")
)

Item.create!(
  name: "ブルーベリープリン",
  detail: "ブルーベリーの果実が贅沢にのったプリンとなっております。",
  price: 500,
  genre_id: 2,
  is_active: true,
  image: open("./app/assets/images/BlueberryPudding.png")
)

Item.create!(
  name: "キャラメルプリン",
  detail: "キャラメル好きにはたまらないプリンとなっております。",
  price: 500,
  genre_id: 2,
  is_active: true,
  image: open("./app/assets/images/CaramelPudding.png")
)

Item.create!(
  name: "チョコレートムース",
  detail: "3種類のチョコが楽しめるチョコケーキとなっております。コーヒーと一緒にお召し上がりいただくことをお勧めしております。",
  price: 600,
  genre_id: 1,
  is_active: true,
  image: open("./app/assets/images/ChocoCake.png")
)

Item.create!(
  name: "ストロベリーミルクプリン",
  detail: "苺の果実がたっぷりのっているミルクプリンとなっております。",
  price: 400,
  genre_id: 2,
  is_active: true,
  image: open("./app/assets/images/StrawberryPudding.png")
)

Item.create!(
  name: "チョコレートクッキー",
  detail: "チョコレートチップをふんだんに使った口当たりがソフトなチョコレートクッキーとなっております。",
  price: 250,
  genre_id: 3,
  is_active: true,
  image: open("./app/assets/images/ChocoCookie.png")
)

Item.create!(
  name: "フルーツシフォンケーキ",
  detail: "ホールタイプのシフォンケーキとなっております。",
  price: 2500,
  genre_id: 1,
  is_active: true,
  image: open("./app/assets/images/FruitCake.png")
)

Item.create!(
  name: "ハートキャンディ",
  detail: "ストロベリーミルク味のキャンディとなっております。",
  price: 150,
  genre_id: 4,
  is_active: true,
  image: open("./app/assets/images/HeartCandy.png")
)

Item.create!(
  name: "ハニーシフォンケーキ",
  detail: "キュートなハチがトレードマークの蜂蜜のシフォンケーキとなっております。",
  price: 500,
  genre_id: 1,
  is_active: true,
  image: open("./app/assets/images/HoneyCake.png")
)

Item.create!(
  name: "チョコレートプリン",
  detail: "生クリームとの相性が抜群なチョコレートプリンとなっております。",
  price: 400,
  genre_id: 2,
  is_active: true,
  image: open("./app/assets/images/ChocoPudding.png")
)

Item.create!(
  name: "オレンジマフィン",
  detail: "オレンジの果汁が生地に練り込まれたマフィンとなっております。",
  price: 300,
  genre_id: 3,
  is_active: true,
  image: open("./app/assets/images/OrangeMuffin.png")
)

Item.create!(
  name: "パンプキンタルト",
  detail: "甘さ控えめのかぼちゃのタルトとなっております。",
  price: 600,
  genre_id: 1,
  is_active: true,
  image: open("./app/assets/images/PumpkinCake.png")
)

Item.create!(
  name: "サワーキャンディ",
  detail: "オレンジのキャンディ2個とライムのキャンディ2個のセットとなっております。",
  price: 400,
  genre_id: 4,
  is_active: true,
  image: open("./app/assets/images/SourCandy.png")
)

Item.create!(
  name: "チョコレートマフィン",
  detail: "中までチョコレートが楽しめるふんわりと焼き上げたマフィンとなっております。",
  price: 350,
  genre_id: 3,
  is_active: true,
  image: open("./app/assets/images/ChocoMuffin.png")
)

Item.create!(
  name: "ティラミス",
  detail: "口あたりなめらかなティラミスとなっております。",
  price: 600,
  genre_id: 1,
  is_active: true,
  image: open("./app/assets/images/TiramisuCake.png")
)

Item.create!(
  name: "スイカキャンディ",
  detail: "夏にピッタリのスイカ味のキャンディとなっております。",
  price: 200,
  genre_id: 4,
  is_active: true,
  image: open("./app/assets/images/WatermelonCandy.png")
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
