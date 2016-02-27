# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AttendanceRate.create(name: 'E0', rate: 0)
AttendanceRate.create(name: 'EA1', rate: 1)
AttendanceRate.create(name: 'ENA0', rate: 0)
AttendanceRate.create(name: 'A1', rate: 1)
AttendanceRate.create(name: 'NA1', rate: 1)
AttendanceRate.create(name: 'A13', rate: 1.3)
AttendanceRate.create(name: 'NA0', rate: 0)
AttendanceRate.create(name: 'ENA1', rate: 1)

company = Company.create(name: 'FLC London', address: 'Che', phone: '123', website: 'www.london.cn.ua',)
['Kir', 'Pyat', 'Rok', 'Shor', 'Shev'].each do |rc|
  company.offices.create(name: rc)
end

Room.create(name: 'kir1', office_id: '1')
Room.create(name: 'kir2', office_id: '1')
Room.create(name: 'kir3', office_id: '1')
pyat_rooms = [
    [ "pyat1", 2 ],
    [ "pyat2", 2 ],
    [ "pyat3", 2 ],
    [ "pyat4", 2 ],
]
pyat_rooms.each do |name, office_id|
  Room.create( name: name, office_id: office_id )
end
rok_rooms = [
    [ "rok1", 3 ],
    [ "rok2", 3 ],
    [ "rok3", 3 ],
    [ "rok4", 3 ],
    [ "rok5", 3 ],
    [ "rok6", 3 ],
]
rok_rooms.each do |name, office_id|
  Room.create( name: name, office_id: office_id )
end

shor_rooms = [
    [ "shor1", 4 ],
    [ "shor2", 4 ],
    [ "shor3", 4 ],
    [ "shor4", 4 ],
    [ "shor5", 4 ],
    [ "shor6", 4 ],
]
shor_rooms.each do |name, office_id|
  Room.create( name: name, office_id: office_id )
end

Room.create(name: 'shev1', office_id: '5')
Room.create(name: 'shev2', office_id: '5')
Room.create(name: 'shev3', office_id: '5')

['EN', 'DE', 'FR', 'ES', 'IT', 'PL', 'UA'].each do |rc|
  ServiceName.create(name: rc)
end

services = [
    [ 1, 8, 120, 40, 28.75, "ad", "group", "true" ],
    [ 2, 8, 60, 30, 22, "ch", "group", "true" ],
]
services.each do |service_name_id, event_quantity, event_length, uprice, gprice, gtype, ctype, is_active|
  Service.create( service_name_id: service_name_id, event_quantity: event_quantity, event_length: event_length, uprice: uprice, gprice: gprice, gtype: gtype, ctype: ctype, is_active: is_active )
end

CashCollection.create(amount: 100, office_id: 1, admin_id:1)
CashCollection.create(amount: 100, office_id: 1, admin_id:1)
CashCollection.create(amount: 400, office_id: 2, admin_id:1)

Expence.create(amount: 50, user_id: 1)
Expence.create(amount: 50, user_id: 1)
Expence.create(amount: 60, user_id: 2)

attr1s = [
    "prima1",
    "prima2",
    "headway1",
    "headway2",
]
attr1s.each do |name|
  Attr1.create( name: name )
end

attr2s = [
    "children 5-6",
    "children 7-8",
    "children 9-11",
    "children 12-14",
    "children 15-17",
    "adults",
    "individual",
    "adults",
    "@manager"
]
attr2s.each do |name|
  Attr2.create( name: name )
end

attr3s = [
    "starter",
    "weak",
    "meduim",
    "strong",
]
attr3s.each do |name|
  Attr3.create( name: name )
end

Admin.create!([
                  {email: "admin1@example.com", password: "admin1@example.com", password_confirmation: "admin1@example.com", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
              ])

User.create!([
                 {email: "user1@example.com", password: "user1@example.com", password_confirmation: "user1@example.com", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "user2@example.com", password: "user2@example.com", password_confirmation: "user2@example.com", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                 {email: "user3@example.com", password: "user3@example.com", password_confirmation: "user3@example.com", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:44", last_sign_in_at: "2015-02-06 14:03:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
             ])
Guest.create!([
                  {email: "guest1@example.com", password: "guest1@example.com", password_confirmation: "guest1@example.com", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                  {email: "guest2@example.com", password: "guest2@example.com", password_confirmation: "guest2@example.com", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
                  {email: "guest3@example.com", password: "guest3@example.com", password_confirmation: "guest3@example.com", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:44", last_sign_in_at: "2015-02-06 14:03:44", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
              ])