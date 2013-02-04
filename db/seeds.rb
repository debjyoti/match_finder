# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

['registered','banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by_name role
end

role = Role.find_by_name('admin')
admin_user = User.new(username: 'debjyoti_admin', email: 'debjyoti.majumder@gmail.com', password: 'Wwif1l')
admin_user.role = role
admin_user.save
