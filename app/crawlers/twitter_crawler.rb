# -*- coding: utf-8 -*-
class TwitterCrawler
  def initialize(track=nil)
    raise if track.nil?
    @track = track
    EventMachine::run {
      stream = Twitter::JSONStream.connect(
        :path    => URI.encode("/1/statuses/filter.json?track=#{track}"),
        :ssl     => true,
        :port    => 443,
        :oauth   => {
          :consumer_key    => OAUTH[:twitter][:consumer_key],
          :consumer_secret => OAUTH[:twitter][:consumer_secret],
          :access_key      => OAUTH[:twitter][:access_token],
          :access_secret   => OAUTH[:twitter][:access_token_secret]})

      stream.each_item do |item|
        require 'pp'
        log = HashWithIndifferentAccess.new(ActiveSupport::JSON.decode(item))
        p Log.create(:id_str => log[:id_str], :text => log[:text], :user_id_str =>log[:user], :user_icon_url => log[:user][:profile_image_url_https], :track => @track )
      end

      stream.on_error do |message|
        p message
      end

      stream.on_max_reconnects do |timeout, retries|
        p timeout
        p retries
      end
    }
  end
end
