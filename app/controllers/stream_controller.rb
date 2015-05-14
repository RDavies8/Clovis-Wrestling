class StreamController < ApplicationController
  include Tweets

  NUM_TWEETS = 3
  def index
    @tweets = get_recent_tweets(NUM_TWEETS)
    #respond_to do |format|
    #  format.html
    #  format.json
    #end

  end
end
