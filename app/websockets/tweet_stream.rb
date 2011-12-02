require 'rack/websocket'
class TweetStream < Rack::WebSocket::Application
  def initialize(options = {})
    super
    @crawlers = {}
  end

  def on_open(env)
    hashtag =  env['PATH_INFO'].gsub('/', '')
    @channel = EM::Channel.new
    @sid = @channel.subscribe{|msg| send_data msg }
    crawler = @crawlers[hashtag] ||= TwitterCrawler.new(hashtag)
    crawler.channels << @channel
    log("Client connected for #{hashtag}")
  end

  def on_message(env, msg)
    log("Received message: " + msg)
  end

  def on_close(env)
    @channel.unsubscribe(@sid)
    log("Clien disconnected")
  end

  def on_error(env, error)
    log("Error occured: " + error.message)
  end

  def log(message)
    Rails.logger.info(message)
  end
end
