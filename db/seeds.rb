# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chickens = [
    {
      name: "Biscuits",
      age: 5,
      enjoys: "Short flights to rooftops and trees"
    },
    {
      name: "Tender",
      age: 4,
      enjoys: "Crossing the road during rush hour"
    },
    {
      name: "Roast",
      age: 2,
      enjoys: "Clucking until 2pm"
    },
    {
      name: "Cockdoodle",
      age: 2,
      enjoys: "Waking everyone up"
    },
    {
      name: "Parmesan",
      age: 4,
      enjoys: "Hiding in trash cans"
    },
    {
      name: "Fried",
      age: 6,
      enjoys: "Chasing children"
    },
    {
      name: "Grill",
      age: 16,
      enjoys: "Keeping it lean and healthy"
    }
]

chickens.each do |attributes|
    Chicken.create attributes
    p "creating chickens #{attributes}"
end