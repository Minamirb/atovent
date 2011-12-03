class Workshop < ActiveRecord::Base
  has_many :logs
  has_one :page
  has_one :tag, :through => :tagging
  has_one :tagging

  # TODO write test
  def create_tag w
    tag = Tag.find_by_name(w.hashtag)
    if tag.nil?
      tag = Tag.create(:name => w.hashtag)
    end
    w.tag = tag
  end

  def extract_tweets
    tweets = Atovent::Twitter.new.search(hashtag)
    tweets.each do |tweet|
      logs.create(:id_str => tweet[:id], :content => tweet[:text], :user_id_str => tweet[:user][:id], :user_screen_name => tweet[:user][:screen_name], :user_icon_url => tweet[:user][:profile_image_url], :track => hashtag)
    end
  end
  handle_asynchronously :extract_tweets

  after_create do |w|
    unless w.hashtag.empty?
      create_tag w
    end

    w.extract_tweets if w.hashtag.present?
  end
end
