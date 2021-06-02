# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './db/seeds/admin_user.rb'
require './db/seeds/medium.rb'
require './db/seeds/category.rb'
require './db/seeds/country.rb'
require './db/seeds/language.rb'
require './db/seeds/role.rb'
require './db/seeds/watch_method.rb'
require './db/seeds/watch_with.rb'