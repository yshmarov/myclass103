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
