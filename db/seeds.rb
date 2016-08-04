# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Seller.destroy_all
Order.destroy_all
Pickup.destroy_all

Seller.create! [
  { seller_name: "4kinder", seller_rep_name: "Ermek Abikenov", seller_address1: "Makatayev 117", seller_phone: "87055551234", email: "test@test.com", password: "abc123" },
  { seller_name: "kaspi shop", seller_rep_name: "Kim", seller_address1: "Nauryzbai Batyr", seller_phone: "87055551234", email: "test1@test.com", password: "abc123" }
]

Pickup.create! [
  { company: "Dostyk Plaza", email: "pick@pick.com", password: "abc123" },
  { company: "Mega Center", email: "pick1@pick.com", password: "abc123" },
  { company: "Royal Petrol", email: "pick2@pick.com", password: "abc123" },
  { company: "SuperMarket", email: "pick3@pick.com", password: "abc123" },
  { company: "Magnum", email: "pick4@pick.com", password: "abc123" },
  { company: "Bekker", email: "pick5@pick.com", password: "abc123" },
  { company: "Promenade", email: "pick6@pick.com", password: "abc123" }
]
