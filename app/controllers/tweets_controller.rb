class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    def index 
        @tweet = Tweet.new
        @tweets = Tweet.order(:created_at).page(params[:page])
    end 

    def new
        @tweet = Tweet.new
        ref_tweet ||= Tweet.find(params[:format])
        @content = ref_tweet.content
        @tweet_id = ref_tweet.id
    end 

    def retweet 
        redirect_to new_tweet_path(params[:id])
    end 

    def create 
        @tweet = Tweet.create(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            @retweet ||= Retweet.create(retweet_params)
            @retweet.save if @retweet.present?
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
        params.require(:tweet).permit(:user_id, :tweet_id)
    end
end
