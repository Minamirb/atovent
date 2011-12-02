require 'rack/websocket'
class TweetStream < Rack::WebSocket::Application
  def initialize(options = {})
    super
    @channels = []
  end

  def on_open(env)
    hashtag =  env['PATH_INFO'].gsub('/', '')
    p TwitterCrawler.new(hashtag)
    log("Client connected for #{hashtag}")
  end

  def on_close(env)
    log("Clien disconnected")
  end

  def on_error(env, error)
    log("Error occured: " + error.message)
  end

  def log(message)
    Rails.logger.info(message)
  end
end
