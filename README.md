clickbait_generator
===================
A clickbait headline generator in Ruby.

You can run clickbait.rb from the top level directory (this is the original script), or you can run it as a Rails app.

Usage:  clickbait.rb [-w|--whathappens] 

Default behavior, with no arguments, generates a listicle headline: 'N [things] that will [do something hyperbolic]' 

  -w    Generates a 'What Happens Next' type of headline

Examples:

    $ clickbait.rb
    The 28 Insane Ideas That Are Evidence of Aliens from Outer Space
    
    $ clickbait.rb -w
    A Dog Found A Couple of Old Oak Slabs. What Happened Next Will Make You Wish You 
    Could Demand That Two Minutes of Your Life Back.
    
  
