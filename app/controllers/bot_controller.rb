class BotController < ApplicationController

  def handle
    puts "YO!", params
    Slackbot.new.handle_item(params)
    head :ok
  end

end
