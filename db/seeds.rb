# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
gary = User.last

item_1 = Item.create(title: "item 1", owner: gary, category: "sac", brand: "rolex", daily_price: 32, description: "aha", city: "Paris")
