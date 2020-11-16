class RetweetsController < ApplicationController
    def index 
        @retweets = Retweet.all.where(tweet_id: params[:id])
    end 

    def new 
        ref_tweet = Tweet.find(params[:id].to_i)
        @content = ref_tweet.content 
        @tweet_id = ref_tweet.id
        @tweet = Tweet.new
    end
end
