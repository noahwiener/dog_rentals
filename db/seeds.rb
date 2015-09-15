# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


dog1 = Dog.create!(name: "Mack", birth_date: Date.new(2011,2,3),
  color: 'black', sex: 'm', description: "loves fetch")

dog2 = Dog.create!(name: "Rumo", birth_date: Date.new(2014, 4, 4),
  color: 'black', sex: 'm', description: "has gigantic ears")
