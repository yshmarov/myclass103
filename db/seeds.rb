# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
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

Company.create(name: 'FLC London', address: 'Che', email: 'company@example.com', phone: '123', website: 'www.london.cn.ua',)

Office.create(name: 'Kir', company_id: 1)
Office.create(name: 'Pyat', company_id: 1)
Office.create(name: 'Rok', company_id: 1)
Office.create(name: 'Shor', company_id: 1)
Office.create(name: 'Shev', company_id: 1)

Room.create(name: 'kir1', office_id: '1')
Room.create(name: 'kir2', office_id: '1')
Room.create(name: 'kir3', office_id: '1')

Room.create(name: 'pyat1', office_id: '2')
Room.create(name: 'pyat2', office_id: '2')
Room.create(name: 'pyat3', office_id: '2')
Room.create(name: 'pyat4', office_id: '2')

Room.create(name: 'rok1', office_id: '3')
Room.create(name: 'rok2', office_id: '3')
Room.create(name: 'rok3', office_id: '3')
Room.create(name: 'rok4', office_id: '3')
Room.create(name: 'rok5', office_id: '3')
Room.create(name: 'rok6', office_id: '3')

Room.create(name: 'shor1', office_id: '4')
Room.create(name: 'shor2', office_id: '4')
Room.create(name: 'shor3', office_id: '4')
Room.create(name: 'shor4', office_id: '4')
Room.create(name: 'shor5', office_id: '4')
Room.create(name: 'shor6', office_id: '4')

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
                  {email: "admin1@example.com", password: "admin1@example.com", password_confirmation: "admin1@example.com"}
              ])

User.create!([
                 {first_name: 'Yulia', last_name: 'Priymuk', email: "user1@example.com", password: "user1@example.com", password_confirmation: "user1@example.com"},
                 {first_name: 'Kovda', last_name: 'Oksana', email: "user2@example.com", password: "user2@example.com", password_confirmation: "user2@example.com"},
                 {first_name: 'Nadia', last_name: 'Osipchuk', email: "user3@example.com", password: "user3@example.com", password_confirmation: "user3@example.com"},
              ])
Guest.create!([
                 {first_name: 'Lera', last_name: 'Bilonog', email: "guest1@example.com", password: "guest1@example.com", password_confirmation: "guest1@example.com"},
                 {first_name: 'Alla', last_name: 'Milos', email: "guest2@example.com", password: "guest2@example.com", password_confirmation: "guest2@example.com"},
                 {first_name: 'Sasha', last_name: 'Razgon', email: "guest3@example.com", password: "guest3@example.com", password_confirmation: "guest3@example.com"},
              ])
