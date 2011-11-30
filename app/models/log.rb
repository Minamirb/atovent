class Log < ActiveRecord::Base
  def self.extract_tweets(hashtag)
    tweets = Twitter.new.search(hashtag)
    tweets.each do |tweet|
      Log.create(:id_str => tweet[:id], :text => tweet[:text], :user_id_str => tweet[:user][:id], :user_screen_name => tweet[:user][:screen_name], :user_icon_url => tweet[:user][:profile_image_url], :track => hashtag)
    end
  end
end
