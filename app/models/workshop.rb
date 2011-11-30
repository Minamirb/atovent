class Workshop < ActiveRecord::Base
  has_many :logs

  after_create do |w|
    Log.extract_tweets(w.hashtag, w.id) if w.hashtag
  end
end
