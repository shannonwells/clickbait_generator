clickbait_generator
===================
A clickbait headline generator, like those silly things you see on teh internets trying desperately to get you to click on them.

You can run clickbait.rb from the top level directory (this is the original script), or you can run it as a Rails app.

### Rails App
This has multiple types of clickbait headlines to choose from, and it also will properly inflect verbs and nouns, unlike the CLI.
If you run it as a Rails app, be sure to run

        rake db:migrate db:seed
        
In order to have something to display.

### CLI
This is the original, very simple script.  It's still amusing but not nearly as sophisticated as the Rails app.

Usage:  clickbait.rb [-w|--whathappens] 

Default behavior, with no arguments, generates a listicle headline: 'N [things] that will [do something hyperbolic]' 

  -w    Generates a 'What Happens Next' type of headline

Examples:

    $ clickbait.rb
    The 28 Insane Ideas That Are Evidence of Aliens from Outer Space
    
    $ clickbait.rb -w
    A Dog Found A Couple of Old Oak Slabs. What Happened Next Will Make You Wish You 
    Could Demand That Two Minutes of Your Life Back.
    
  
