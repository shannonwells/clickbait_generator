class Slackbot

  SLACKBOT_CONFIG = {
    channel:          ENV.fetch("CLICKBAIT_SLACKBOT_CHANNEL_ID", nil) || ("#" + ENV.fetch("CLICKBAIT_SLACKBOT_CHANNEL", 'blurp')),
    name:             ENV.fetch("CLICKBAIT_SLACKBOT_USERNAME", 'baitbot'),
    incoming_webhook: ENV.fetch("CLICKBAIT_SLACKBOT_WEBHOOK"),
    api_token:        ENV.fetch("CLICKBAIT_SLACKBOT_SECRET_API_TOKEN"),
    slash_token:      ENV.fetch("CLICKBAIT_SLACKBOT_SLASH_TOKEN"),
    outgoing_token:   ENV.fetch("CLICKBAIT_SLACKBOT_OUTGOING_TOKEN")
  }

  attr_reader :client
  delegate :handle_item, to: :client

  def initialize(opts = nil)
    opts = SLACKBOT_CONFIG.merge(opts || {}).with_indifferent_access

    puts opts.inspect

    debugger
    @client = Slackbotsy::Bot.new(opts) do
      hear /echo\s+(.*)/ do |heard|
        post_message "Heard #{heard.inspect}", channel: opts['channel']
      end
    end

  end

end
