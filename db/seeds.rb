# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Furries', 'Manatee', "Hippie",  "Vegan", "Terrorist", "Angry Virgin", "Communist", "Republican", "Democrat", "Tosher", "Perisher", "Frood", "Old Biddie", "Reptile", "Guy", "Little Boy", "Cranky Old Cat", "Micropig", "Baby Hedgehog", "Little Girl", "Old Man", "Old Woman", "Fireman", "Policeman", "Bunny", "Monkey", "Scientist", "Dog", 'American', 'White Person', 'Baby', 'Puppy', 'Kitten', 'Person', 'Friend',  'Lover',  'Superhero', 'Celebrity', 'Clown', 'Criminal',  'Dude', 'Bully', 'Street Musician', 'Kitten', 'Dog', 'Scientist', 'Puppy', 'Monkey', 'Bunny', 'Policeman', 'Fireman', 'Old Woman', 'Old Man', 'Little Girl', 'Baby', 'Baby Hedgehog', 'Micropig', 'Old Cat', 'Little Boy', 'Guy','Reptile', 'Nerd','Geek','Cosplayer','Otaku'].each do |n|
    newnoun = Noun.find_or_initialize_by(value: n)
    newnoun.is_agent = true
    newnoun.save!
end

SEASONAL_NOUNS = {
    :halloween => ["Necronomicon", "Poison", "Puppet", "Voodoo Doll", "Gravestone", "Grave", "Dead Body", "Magpie", "Owl", "Raven", "Bram Stoker", "Mary Shelley", "Edgar Allan Poe", "H.P. Lovecraft", "Spider", "Vincent Price", "Dracula", "Elvira", "Bela Lugosi", "Lon Chaney", "Christopher Lee", "Black Bat", "Black Cat", "Goblin", "Ghoul", "Skeleton", "Monster", "Vampire", "Zombie", "Ghost", "Samhain"],
    :winter => ['Jingle Bell', 'Christmas Tree', 'Dreidel', 'Menorah', 'Sock', 'Gelt', 'Latke', 'Mitzvah','Candle', 'Candy Cane', 'Stocking', 'Snowflake', 'Sleigh', 'Christmas Carol', 'Sugar Plum', 'Nutcracker', 'Plum Pudding','Icicle','Snowboard','Yule', 'Angel', 'Elf','Snowman', 'Snow Woman']
}

['Wil Wheaton',"Obama", "The FBI", "Bill Maher", "Bill O'Reilly", "Ann Coulter", "Rush Limbaugh", "Glenn Beck","Vladimir Putin", "The CIA", "They",'Chris Hardwick'].each do |n|
  newnoun = Noun.find_or_initialize_by(value: n)
  newnoun.is_agent = true
  newnoun.is_proper = true
  newnoun.save!
end

['Low-Carb Lunch', 'Book', 'Photo', 'Movie', 'Rumor', 'Conspiracy Theory', 'Sign', 'Country', 'City', 'House','Observation', 'Interview Question', 'Fashion Mistake','Recycling Mistake', 'Felony','Stunning Things','Reason', 'Idea', 'Secret','Explanation','Pachenko Game','Fortune Teller','Circus','Kiss','Sex Toy'].each do |n|
  newnoun = Noun.find_or_create_by(value: n)
  newnoun.is_agent = false
  newnoun.save!
end

SEASONAL_PROPER_NOUNS={
    :halloween => ["Christopher Lee","Lon Chaney","Bela Lugosi","Elvira","Dracula","Vincent Price",'H.P. Lovecraft','Edgar Allan Poe','Mary Shelley','Bram Stoker'],
    :winter => ['King Wenceslas', 'Charles Dickens', 'Ebenezer Scrooge','Krampus', 'Santa Claus', 'Mrs. Claus']
}

  ["Are Innocent-Looking Enough, But Actually Quite Dangerous','Are A Hot Mess",'Mean Something Changed In the Matrix','Taste Just Like Iguana', 'Are Sponge-Worthy','Post Way Too Many Selfies','Could Double As A Demonic Lamp','Will Ruin Your Life', 'You Should Avoid At All Costs', 'Will Make You Care About Climate Change', 'We Hate', 'We Love', 'Will Make You Cry', 'Will Make You Sick', "Prove You're a Sociopath", 'Are Evidence of Aliens from Outer Space', 'Are Probably True', 'You Should Never Eat', 'Mean Your Relationship is Doomed', "Signal He's Cheating", 'Will Amaze You', "You Can't Trust", 'Haunt Your Nightmares', 'You Should Never Do In London', 'Need A Place In Your Home', 'Will Blow Your Mind', "Prove You're With The Right Person", "Mean You're Adopted", 'All Tea Lovers Need In Their Lives', 'Prove Teachers Can Have Fun Too', 'You Have To Tell Your Mother About', 'Nobody Knows About', 'Californians Are Tired Of', 'Prove San Francisco Blows Goats', 'Single People Know Too Well', "Circuses Don't Want You To Know", 'Rock You To Your Core', 'Warm Your Heart', 'You Should See Before You Die', 'Mean You Have A Terminal Illness', "Prove You're A Complete Jerk", "Indicate You're Awesome", 'Only Clumsy People Will Understand', 'Only Beautiful People Will Understand', 'Only Men Will Understand', 'Only Women Will Understand', 'Are Old And Busted', "You Ignore At Your Peril", "They Don't Want You to See", "Doctors Don't Want You To Know", "The Government is Hiding from You", 'Need To Stop Doing To Women', 'Boldly Show How Different Life Is In the Two Koreas', 'You Should Not Click On No Matter What', 'People Make Every Day', "You Have Probably Already Done and Don't Know It", "Will Make You Punch Yourself In The Taint","Have A Dark Side", "Have A Lot Of Rules For Women", "Think They're Getting Away With It", "Believe They Can Do Absolutely Everything", "Might Be Keeping A Dirty Secret", "Made My Stomach Turn", "Absolutely Deserve A Dirty Look In Response", "You Must Do To Get Your First Promotion", "Will Derail Your Career", "Has Ever Been Photographed", "Grew Up To Be Ugly", "Broke All The Stereotypes", "If You Don't Click It I'll Get Fired Please I Need My Job", "Really Know Where Their Towels Are", "Are The Bees Knees", "Were In The Military", "Are Invading Your Home", "Just Had A Baby", "Dressed In Drag",'Is Kinda Cool, But You Could Probably Skip It',"Are Mildly Amusing If You're Into That Kind Of Thing",'Made Me LQTM','You Won\t Believe','Will Make You Cry Out For Brain Bleach',"Don't Actually Exist",'Are Not Worth A Freakout','Are a Worse Threat Than Terrorism','Hijacked U.S. Military Social Media Accounts','Just Landed A $15M Investment','Broke The Internet','Won The Internet','Are Crazy... LIKE A FOX',"Can't Stop Smiling"].each do |p|
    Predicate.find_or_create_by(value: p)
  end
  ['Best', 'Worst', 'Greatest', 'Silliest', 'Dumbest', 'Tiniest','Biggest','Most Dangerous', 'Safest', 'Strangest', 'Creepiest', 'Funkiest', 'Hottest', 'Grossest', 'Most Breathtaking', 'Most Astonishing', 'Insane', 'Most Amazing', 'Heartbreaking', 'Saddest', 'Happiest', 'Most Exciting', 'Healthiest', 'Most Poisonous', 'Unhealthiest', 'Time-Travelling', 'Most Terrifying', 'Annoying', 'Secret', 'Craziest', 'Weirdest', 'Most Stunning','Epic','Most Hideous','Most Disgusting'].each do |n|
    Superlative.find_or_create_by(value: n)
  end


  ['Cranky','Great', 'Funny','Weird','Silly','Dumb','Dangerous','Strange','Creepy','Funky','Hot','Cool','Breathtaking','Astonishing','Crazy','Insane','Radical','Gnarly','Grody','Amazing','Heartbreaking','Tragic','Pathetic','Joyous','Exciting','Unhealthy','Poisonous','Diseased','Time-Travelling','Terrifying','Horrifying','Irritating','Rude','Secret','Shameless','Stunning','Ancient','Alien','Boozy',"Mind-Boggling", "Barking Mad", "Loony", "Spectacular", "Gorgeous", "Filthy", "Dirty", "Combustible", "Irresistible", "Hoopy", "Alien", "Ancient", "Stunning", "Shameless",'Stinky','Fabulous','Record Breaking', 'Mind Numbing', 'Coma Inducing','Unbelievable','Incredible','Whiny','Adorable','Filthy Rich','Unbearable','Insufferable','Despicable','Heartwarming','Record-Breaking'].each do |a|
    a = Adjective.find_or_create_by(value: a)
    ap adj_errs: a.errors.full_messages unless a.persisted?
  end

SEASONAL_ADJ = {
    :halloween => [ "Ghoulish", 'Ghastly', 'Fiendish', 'Devilish', 'Haunted', 'Undead', 'Dead','Bloody','Bleeding'],
    :winter => ["Icy", "Snowy", "Yuletide", "Christmasy", "Fried", "Festive", 'Sparkling', 'Jingling']
}

  ["Signed A Petition", "Called This News Anchor Fat", 'Flew Over A Pig Farm', "Was Tipped By A Girl", "Started Off Well", 'Did a Study', 'Made a Horrible Decision', 'Gave A Homeless Person Some Money', 'Washed His Car', 'Saw A Kitten Drowning', 'Took This Photograph', 'Tried To Climb Mount Everest', 'Woke Up To Find The House on Fire', 'Sowed Some Magic Beans', 'Was Getting Bombarded With Complaints', 'Stumbled Upon An Abandoned House In the Woods', 'Found A Couple of Old Oak Slabs', 'Finally Solved That Weird Puzzle Box In the Attic', 'Picked Up Some Hitchhikers', 'Discovered His Eyebrows', 'Sees For the First Time What A Jerk They Are', 'Saw A Bee', 'Discovered There Were Snakes On His Motherfuckin\' Plane', 'Found a Mysterious Board Game And Decided to Play It','Cut a Cabbage in Half','Told Us You Farted', 'Saw These Boxes On A Lawn', "Wanted To Be A Princess",'Took On Racism With Cupcakes','Had Given Up On Human Connection'].each do |n|
    First.find_or_create_by(value: n)
  end

  ["O*@$& H4X!!!11one HAHAHA", ". . . Please, We Really Need The Clickthroughs", 'Is So Worth Your Time',"Is A Bit of All Right", "Will Stun You", "Will Warm the Cockles of Your Heart. Whatever That Means", "Might Be The Cutest Thing In the Universe. Seriously","Will Blow Your Mind", "Will Give You the Heebie-Jeebies", "Will Tingle Your Naughty Bits", "Will Make You Cry", "Will Make Your Life Worth Living", "Will Allow You To Die Happy", "Will Creep You Right Out", "Will <em>Literally</em> Scare You to Death", "Will Make You Crap Your Pants", "Is Incredible", "Blew the Whole City Away", "Is Disturbing", "Made a Lot of Scientists Very, Very Upset", "Is All Your Fault", "Is All Our Fault", 'Will School You To The Max', "Is the Best Thing We've Seen All Year", "Is the Best Thing You'll See In The Whole Frigging World", "Will Make All Your Other Life Experiences Pale In Comparison And You'll Just Want to End It All Immediately", "Will Surprise You", "Is Leaving Billions of People Homeless and Starving", "Made Me -- And Millions of Women -- Feel Great", "Will Shock You. Except Not", "You'll Never Forget", "Is Probably Not Worth Your Time", "Will Make You Wish You Could Demand That Two Minutes of Your Life Back", "Is Straight From Your Worst Nightmare. Trust Me", 'Is Hysterical', 'Might Be The Cutest Thing In the Universe. Seriously', 'Will Warm the Cockles of Your Heart. Whatever That Means','Darth Vader Would Be Proud Of','Gets Epicker and Epicker',"Will Be Your New Favorite Acid Trip", ". . . Just Click It Already", "Has A Tragic Twist", "Is Really Dumb, But You'll Click Anyway", "Will Make You Realize You Should Get Out More Often", "Will Render You Completely Unable To Get Any Work Done", "Is Yet Another Internet Rabbit Hole", "Will Give You All The Feels",'Cannot Be Unseen','Broke The Internet','Won The Internet','Made Me LQTM','You Won\t Believe','Will Make You Cry Out For Brain Bleach','Will Have You In Tears','Is Kleenex-Worthy','Will Make You Be Like...WHOA'].each do |n|
    Next.find_or_create_by(value: n)
  end

  Particle.find_or_create_by(value: 'This')
  Particle.find_or_create_by(value: 'A')
  Particle.find_or_create_by(value: 'Some', is_singular: false)
["Take Over", "Keep", "Live By", "Tell Anyone About", "Reveal", "Steal", "Befriend", "Run Into", "Marry", "Know", "Answer", "Feel", "Approach", "Run Away From", "Taste", "Watch", "Smell", "Hear", "See", "Be Rescued From",'Be Stunned By','Snog','Ogle','Eat','Sniff','Stun','Trick','Fool','Disrobe','Strip'].each do |v|
    newverb = Verb.find_or_initialize_by(value: v)
    newverb.needs_agent = true
    newverb.save!
  end
