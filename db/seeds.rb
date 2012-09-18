# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Pedro F', :email => 'pferrer88@gmail.com', :password => 'asdqwe', :password_confirmation => 'asdqwe'
# user.confirm!
puts 'New user created: ' << user.name
user.add_role :admin

user = User.create! :name => 'Tomas Dildo', :email => 'tomas.balza@gmail.com', :password => 'abc123', :password_confirmation => 'abc123'
# user.confirm!
puts 'New user created: ' << user.name
user.add_role :admin