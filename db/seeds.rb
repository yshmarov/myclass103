# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
company = Company.create(name: 'FLC London', website: 'www.london.cn.ua')
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

AttendanceRate.create(name: 'E0', rate: 0)
AttendanceRate.create(name: 'EA1', rate: 1)
AttendanceRate.create(name: 'ENA0', rate: 0)
AttendanceRate.create(name: 'A1', rate: 1)
AttendanceRate.create(name: 'NA1', rate: 1)
AttendanceRate.create(name: 'A13', rate: 1.3)
AttendanceRate.create(name: 'A0', rate: 0)
AttendanceRate.create(name: 'ENA1', rate: 1)