class RetweetsController < ApplicationController
    def index 
        @retweets = Retweet.all.where(tweet_id: params[:id])
    end 
end
