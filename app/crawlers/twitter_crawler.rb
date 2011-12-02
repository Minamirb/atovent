# -*- coding: utf-8 -*-
class TwitterCrawler
  def initialize(track, channel=nil)
    raise if track.nil?
    @track = track
    EventMachine::run {
      stream = Twitter::JSONStream.connect(
#         :path    => "/1/statuses/sample.json",
        :path    => URI.encode("/1/statuses/filter.json?track=#{track}"),
        :ssl     => true,
        :port    => 443,
        :oauth   => {
          :consumer_key    => OAUTH[:twitter][:consumer_key],
          :consumer_secret => OAUTH[:twitter][:consumer_secret],
          :access_key      => OAUTH[:twitter][:access_token],
          :access_secret   => OAUTH[:twitter][:access_token_secret]})

      stream.each_item do |item|
        log = HashWithIndifferentAccess.new(ActiveSupport::JSON.decode(item))
        log = Log.new(:id_str => log[:id_str], :text => log[:text], :user_id_str =>log[:user], :user_icon_url => log[:user][:profile_image_url_https], :track => @track )
        #log.save
        channel.push log.to_json if channel
      end

      stream.on_error do |message|
        Rails.logger.info message
      end

      stream.on_max_reconnects do |timeout, retries|
        Rails.logger.info "#{timeout}: #{retries}"
      end
    }
  end
end
