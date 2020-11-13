class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    def index 
        @tweet = Tweet.new
        @tweets = Tweet.all
    end 

    def new 
        @tweet = Tweet.new
    end 

    def create 
        @tweet = Tweet.create(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            redirect_to tweets_path, notice: 'Tweet was created successfully'
        else 
            render :new 
        end
    end 

    def show 
        
    end 

    def edit 
    end

    def update
        if @tweet.update(tweet_params)
            redirect_to @tweet, notice: 'Your tweet was successfully updated.'
        else  
            render edit_tweet_path, notice: "Your tweet couldn't be updated"
        end
    end 

    def destroy 
        @tweet.destroy 
        redirect_to tweets_path, notice: "Tweet was successfully destroyed"
    end

    private 
    def set_tweet 
        @tweet = Tweet.find(params[:id])
    end

    def tweet_params 
        params.require(:tweet).permit(:content, :user_id)
    end

end
