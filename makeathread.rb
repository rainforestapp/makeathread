require 'slack-ruby-bot'
require 'webrick'

# Dumb server to keep Heroku happy
server = WEBrick::HTTPServer.new :Port => ENV['PORT']
server.mount_proc '/' do |req, res|
  res.body = 'ok'
end

Thread.new do
  server.start
end

class MakeAThead < SlackRubyBot::Bot
  match // do |client, data, match|
    unless data.user == 'emanuel'
      client.web_client.reactions_add(
        channel: data.channel,
        name: 'make-a-thread',
        timestamp: data.ts,
      )
    end
  end
end

MakeAThead.run
