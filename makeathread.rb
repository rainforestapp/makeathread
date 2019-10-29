require 'slack-ruby-bot'

class MakeAThead < SlackRubyBot::Bot
  match // do |client, data, match|
    client.web_client.reactions_add(
      channel: data.channel,
      name: 'make-a-thread',
      timestamp: data.ts,
    )
  end
end

MakeAThead.run
