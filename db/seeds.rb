# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Americans', 'White People', 'Babies', 'Puppies', 'Kittens', 'People', 'Friends', 'Books', 'Photos', 'Movies', 'Rumors', 'Conspiracy Theories','Signs', 'Countries','Cities','Houses','Lovers','Explanations','Reasons','Ideas', 'Low-Carb Lunches', 'Superherioes','Observations','Interview Questions','Celebrities','Secrets','Clowns','Criminals','Fashion Mistake', 'Some Dudes', 'The Recycling Mistake', 'Felonies'].each do  |n|
  Noun.create(name: n)
end

