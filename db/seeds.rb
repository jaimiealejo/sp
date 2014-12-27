# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
['secretary', 'dentist', 'admin'].each do |role|
	Role.where({name: role}).first_or_create
end

# User with ID 1 is always admin (role_id 3)
user = User.find(3)
user.update_attributes(role_id:3) if user.role_id != 3
