class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index 
    end 

    def new 
        @tweet = Tweet.new
    end 

    def create 
        @tweet = Tweet.create(tweet_params)
        @tweet.user_id = current_user.id
        @tweet.save!
    end 

    def show 
    end 

    def edit 
    end

    def update  
    end 

    def destroy 
    end

end
