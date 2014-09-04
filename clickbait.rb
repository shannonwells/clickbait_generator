#!/usr/bin/env ruby
require 'rubygems'
require 'optparse'

NOUNS=['Americans', 'White People', 'Babies', 'Puppies', 'Kittens', 'People', 'Friends', 'Books', 'Photos', 'Movies', 'Rumors', 'Conspiracy Theories','Signs', 'Countries','Cities','Houses','Lovers','Explanations','Reasons','Ideas', 'Low-Carb Lunches', 'Superherioes','Observations','Interview Questions','Celebrities','Secrets','Clowns','Criminals','Fashion Mistake', 'Some Dudes', 'The Recycling Mistake', 'Felonies']
ADJECTIVES=['Best', 'Worst', 'Greatest', 'Silliest', 'Dumbest', 'Most Dangerous', 'Safest', 'Strangest', 'Creepiest', 'Funkiest','Hottest','Grossest', 'Most Breathtaking','Most Astonishing','Insane','Most Amazing', 'Heartbreaking','Saddest', 'Happiest', 'Most Exciting','Healthiest', 'Most Poisonous', 'Unhealthiest', 'Time-Travelling','Most Terrifying','Annoying','Secret']
PREDICATES=['Will Ruin Your Life', 'You Should Avoid At All Costs', 'Will Make You Care About Climate Change','We Hate','We Love','Will Make You Cry','Will Make You Sick', 'Prove You\'re a Sociopath', 'Are Evidence of Aliens from Outer Space', 'Are Probably True', 'You Should Never Eat','Mean Your Relationship is Doomed', 'Signal He\'s Cheating','Will Amaze You','You Can\'t Trust','Haunt Your Nightmares','You Should Never Do In London', 'Need A Place In Your Home','That Will Blow Your Mind','Prove You\'re With The Right Person','Mean You\'re Adopted','All Tea Lovers Need In Their Lives','Prove Teachers Can Have Fun Too', 'You Have To Tell Your Mother About','Nobody Knows About','Californians Are Tired Of','Prove San Francisco Blows Goats','Single People Know Too Well','Circuses Don\'t Want You To Know' ,'Rock You To Your Core','Warm Your Heart','You Should See Before You Die','Mean You Have A Terminal Illness','Prove You\'re A Complete Jerk','Indicate You\'re
Awesome','Only Clumsy People Will Understand', 'Only Beautiful People Will Understand', 'Only Men Will Understand','Only Women Will Understand', "You're Probably Making", 'Are Old And Busted',"You Ignore At Your Peril", "They Don't Want You to See", "Doctors Don't Want You To Know", "The Government is Hiding from You", 'Need To Stop Doing To Women', 'Boldly Show How Different Life Is In the Two Koreas', 'You Should Not Click On No Matter What', 'That People Make Every Day', "That You Have Probably Already Done and Don\'t Know It"]

SINGULAR_NOUNS = ['Bully', 'Street Musician', 'Kitten', 'Dog', 'Scientist', 'Puppy', 'Monkey', 'Bunny', 'Policeman', 'Fireman', 'Old Woman', 'Old Man', 'Little Girl', 'Baby' , 'Baby Hedgehog', 'Micropig', 'Cranky Old Cat', 'Little Boy', 'Guy']
FIRST=[ "Called This News Anchor Fat" , "Was Tipped By A Girl", "Started Off Well", 'Did a Study', 'Made a Horrible Decision', 'Gave A Homeless Person Some Money', 'Washed His Car', 'Saw A Kitten Drowning', 'Took This Photograph', 'Tried To Climb Mount Everest', 'Woke Up To Find The House on Fire', 'Sowed Some Magic Beans', 'Was Getting Bombarded With Complaints', 'Stumbled Upon An Abandoned House In the Woods', 'Found A Couple of Old Oak Slabs', 'Finally Solved That Weird Puzzle Box In the Attic', 'Picked Up Some Hitchhikers', 'Discovered His Eyebrows', 'Sees For the First Time What A Jerk They Are', 'Saw A Bee', 'Discovered There Were Snakes On His Motherfuckin\' Plane', 'Found a Mysterious Board Game And Decided to Play It']

NEXT=["Will Blow Your Mind", "Will Give You the Heebie-Jeebies", "Will Tingle Your Naughty Bits", "Will Make You Cry", "Will Make Your Life Worth Living", "Will Allow You To Die Happy", "Will Creep You Right the Fuck Out", "Will Literally Scare You to Death", "Will Make You Crap Your Pants", "Is Incredible", "Blew the Whole City Away", "You Cannot Believe Your Eyes", "Is Disturbing", "Made a Lot of Scientists Very, Very Upset", "Is All Your Fault", "Is All Our Fault", 'Will School You To The Max', "Is the Best Thing We've Seen All Year", "Is the Best Thing You'll See In The Whole Frigging World", "Will Make All Your Other Life Experiences Pale In Comparison And You'll Just Want to End It All Immediately", "Will Surprise You", "Is Leaving Billions of People Homeless and Starving", "Could Be Right Now", "Made Me -- And Millions of Women -- Feel Great", "Will Shock You. Except Not", "You'll Never Forget", "Is Probably Not Worth Your Time", "Will Make You Wish You Could Demand That Two Minutes of Your Life Back", "Chill You to the Bone", "Is Straight From Your Worst Nightmare. Trust Me", 'Is Hysterical', 'Might Be The Cutest Thing In the Universe. Seriously', 'Warm the Cockles of Your Heart.  Whatever TF That Means']

PARTICLES=%w(This A Some)

Random.new(Time.now.to_i)
items = rand(99)+2

options ={ :whn => false }
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-w", "--whathappens", "Generate 'What Happens Next' headline") do |v|
    options[:whn] = true
  end

end.parse!

if options[:whn]
    noun = SINGULAR_NOUNS[rand(SINGULAR_NOUNS.length-1)]
    first = FIRST[rand(FIRST.length-1)]
    next_clause = NEXT[rand(NEXT.length-1)]
    particle = PARTICLES[rand(PARTICLES.length-1)]
    sentence = "#{particle} #{noun} #{first}. What Happened Next #{next_clause}."
else
    noun = NOUNS[rand(NOUNS.length-1)]
    adj = ADJECTIVES[rand(ADJECTIVES.length-1)]
    pred = PREDICATES[rand(PREDICATES.length-1)]
    sentence = "The #{items} #{adj} #{noun} That #{pred}"
end
