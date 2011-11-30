class Workshop < ActiveRecord::Base
  after_create do |w|
    Log.extract_tweets(w.hashtag) if w.hashtag
  end
end
