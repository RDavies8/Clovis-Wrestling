module Tweets
  require 'twitter'


  def get_recent_tweets numTweets
    client = Twitter::REST::Client.new do |config|
      config.consumer_key       = 'ta5r898M3E8FYt3iVt5SAuZyA'
      config.consumer_secret    = 'mvEaKWvzm8rGj7QbPgH679NGKdaAjoYoIr45293ZRhQe7yk6dM'
      config.access_token        = '632720712-TzCws29Vqtd5rSd5kpy0KMZPHZxcncUYn8YbUV3k'
      config.access_token_secret = 'shuF9pzS26ebjoJEYllyOKRMbkzu0C3K0AMazyZEV045I'
    end

    tweets = client.user_timeline('ClovisWrestling', count: numTweets)

    return tweets
  end
end