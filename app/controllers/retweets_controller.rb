class RetweetsController < ApplicationController
    def index 
        @retweets = Retweet.all.where(tweet_id: params[:id])
    end 

    def new 
        ref_tweet = Tweet.find(params[:id].to_i)
        @tweet_id = ref_tweet.id
    end

    def create

    end
end
