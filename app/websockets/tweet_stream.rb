require 'rack/websocket'
class TweetStream < Rack::WebSocket::Application
  def initialize(options = {})
    super
    @crawlers = {}
  end

  def on_open(env)
    workshop_id =  env['PATH_INFO'].gsub('/', '')
    @channel = EM::Channel.new
    @sid = @channel.subscribe{|msg| send_data msg }
    crawler = @crawlers[workshop_id] ||= TwitterCrawler.new(workshop_id)
    crawler.channels << @channel
    log("Client connected for workshop id:#{workshop_id}")
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
