class Twitter < OAuthRubytter
  def initialize
    oauth = OAUTH[:twitter]
    consumer = ::OAuth::Consumer.new(oauth[:consumer_key], oauth[:consumer_secret], :site => 'http://api.twitter.com')
    access_token = ::OAuth::AccessToken.new(consumer, oauth[:access_token], oauth[:access_token_secret])
    super(access_token)
  end
end
