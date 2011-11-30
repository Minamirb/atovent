class Workshop < ActiveRecord::Base
  has_many :logs

  def extract_tweets
    tweets = Twitter.new.search(hashtag)
    tweets.each do |tweet|
      logs.create(:id_str => tweet[:id], :text => tweet[:text], :user_id_str => tweet[:user][:id], :user_screen_name => tweet[:user][:screen_name], :user_icon_url => tweet[:user][:profile_image_url], :track => hashtag)
    end
  end
  handle_asynchronously :extract_tweets

  after_create do |w|
    w.extract_tweets if w.hashtag.present?
  end
end
