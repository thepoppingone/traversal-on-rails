# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

open("tmp/cities15000.txt") do |cities|
  cities.read.each_line do |city|
    city_data = city.chomp.split("\t")
    City.create!(:name => city_data[1], :country_code => city_data[8])
  end
end