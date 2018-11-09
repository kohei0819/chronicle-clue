# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Medium.create(:id => 1, :name => 'movies', :name_jp => '映画', :sort => 1)
Medium.create(:id => 2, :name => 'dramas', :name_jp => 'ドラマ', :sort => 2)
Medium.create(:id => 3, :name => 'books', :name_jp => '本', :sort => 3)
Medium.create(:id => 4, :name => 'people', :name_jp => '人', :sort => 4)

CSV.foreach('db/seeds/countries.csv') do |row|
  Country.create(:id => row[0], :name => row[1], :name_jp => row[2], :sort => row[3])
end

CSV.foreach('db/seeds/languages.csv') do |row|
  Language.create(:id => row[0], :name => row[1], :name_jp => row[2], :shortened => row[3], :sort => row[4])
end

CSV.foreach('db/seeds/categories.csv') do |row|
  Category.create(:id => row[0], :name => row[1], :name_jp => row[2], :parent => row[3])
end

CSV.foreach('db/seeds/movies1.csv') do |row|
  WikiCoordination.create(:title => row[0], :kind => 1)
end
CSV.foreach('db/seeds/movies2.csv') do |row|
  WikiCoordination.create(:title => row[0], :kind => 1)
end

MovieRole.create(:id => 1, :name => 'actor', :name_jp => '俳優', :sort => 1)
MovieRole.create(:id => 2, :name => 'director', :name_jp => '監督', :sort => 2)
MovieRole.create(:id => 3, :name => 'scenario', :name_jp => '脚本', :sort => 3)
MovieRole.create(:id => 4, :name => 'distributed', :name_jp => '制作', :sort => 4)
MovieRole.create(:id => 5, :name => 'producer', :name_jp => '製作総指揮', :sort => 5)
