# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails db:seedを忘れずに
Admin.create!(
   email: 'test@test.com',
   password: '000000'
)

# 5.times do |n|
#    Customer.create!(
#       last_name: "名字#{n + 1}",
#       first_name: "名前#{n + 1}",
#       last_name_kana: "ミョウジ#{n + 1}",
#       first_name_kana: "ナマエ#{n + 1}",
#       email: "test#{n + 1}@test.com",
#       postal_code: "000000#{n + 1}",
#       address: "東京都渋谷区代々木神園町0-#{n + 1}",
#       telephone_number: "0000000000#{n + 1}",
#       password: "11111#{n + 1}",
#       password_confirmation: "11111#{n + 1}"
#  )
# end