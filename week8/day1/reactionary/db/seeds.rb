# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cheeses = %w(blue feta swiss colby 'merican gouda cheddar)
types = %w(natural-rind semi-soft blue-cheese flava-flav-cheese hard-cheese)

10.times do
  User.create(name: Faker::Name.name,
              preference: Faker::Hacker.noun)
end
50.times do
  Cheese.create(name: cheeses.sample,
                style: types.sample )
end
