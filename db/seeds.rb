# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

25.times do
   Application.create!(
       :title => Faker::Name.name,
       :url => Faker::Internet.domain_name,
       :event => Faker::Commerce.color
    )    
end

User.create!(
    :username => "doomhammer",
    :email => "doomhammer@dhammer.com",
    :password => "hammer123"
    )