# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

100.times do 
  Thermostat.create(location: Faker::Address.full_address)
end

99999.times do 
  Reading.create(thermostat_id: rand(1..100), temperature: rand(-10..44), humidity: rand(1..100), battery_charge: rand(1..100))
end
