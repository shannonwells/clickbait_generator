clickbait_generator
===================
A clickbait headline generator, like those silly things you see on teh internets trying desperately to get you to click on them.

This project is being rewritten in Elixir/Phoenix.  This codebase will then be EOLed.

### Current build status: 
[![CircleCI](https://circleci.com/gh/shannonwells/clickbait_generator.svg?style=svg)](https://circleci.com/gh/shannonwells/clickbait_generator)

You can run clickbait.rb from the top level directory (this is the original script), or you can run it as a Rails app.

### Rails App

To see it in action, see http://www.buzzkillfeed.me   

This has multiple types of clickbait headlines to choose from, and it also will properly inflect verbs and nouns, unlike the CLI.
If you run it as a Rails app, be sure to run

        rake db:migrate db:seed
        
In order to have something to display.
