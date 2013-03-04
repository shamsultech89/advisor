# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'yaml'
ACCOUNT_TYPE = ['Admin','Client']
ACCOUNT_TYPE.each do |account_type|
   AccountType.create!(:name => account_type, :status => 1)
end

User.create!(:first_name => 'Shamsul', :last_name => 'Haque', :email => 'shamsulsham89@gmail.com',:password => 'shamsul',:password_confirmation => 'shamsul', :account_type_id => '1')
User.create!(:first_name => 'Rahul', :last_name => 'Sharma',  :email => 'shamsultech89@gmail.com',:password => 'shamsul',:password_confirmation => 'shamsul', :account_type_id => '2')

