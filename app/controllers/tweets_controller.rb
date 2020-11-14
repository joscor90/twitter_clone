class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    def index 
        @tweet = Tweet.new
        @tweets = Tweet.all
    end 

    def new
        @retweet ||= Retweet.new(user_id: current_user.id, tweet_id: params[:format])
        @tweet = Tweet.new
        @content = Tweet.find(@retweet.tweet_id).content
    end 

    def retweet 
        redirect_to new_tweet_path(params[:id])
    end 

    def create 
        @tweet = Tweet.create(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            byebug
            if params[:retweet] 
                @retweet = Retweet.create(user_id: @tweet.user_id, tweet_id: @tweet.id)
                @retweet.save!
                redirect_to tweets_path, notice: 'Tweet was created successfully'
            else 
                redirect_to tweets_path, notice: 'Tweet was created successfully'
            end
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
            render :edit, notice: "Your tweet couldn't be updated"
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

    def retweet_params
        params.require(:retweet).permit(:id)
    end

end
