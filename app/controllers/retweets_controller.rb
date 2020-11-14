class RetweetsController < ApplicationController
    def index 
        @retweets = Retweet.find(params[:id])
    end 
end
