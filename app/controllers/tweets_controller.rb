class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    def hashtags 
        hashtag = params.require(:hashtag)
        @hashtag = "#{hashtag.gsub(/\W/,"")}"
        @hashtag_tweets = []
        tweets = Tweet.all
        tweets.each do |tweet|
            content_arr  = tweet.content.split(" ")
            content_arr.each do |w| 
                if w[0] == "#"
                    if w.gsub(/\W/, "") == @hashtag
                        @hashtag_tweets.push(tweet)
                    end
                end
            end
        end
    end

    def index
        @q = Tweet.ransack(params[:q])
        if user_signed_in?
            @tweet = Tweet.new
            frens = current_user.friends.pluck(:friend_id)
            if frens.empty?
                @tweets = @q.result(distinct: true).order("created_at DESC").page(params[:page])
            else 
                @tweets = @q.result(distinct: true).tweets_for_me(frens, current_user.id).order("created_at DESC").page(params[:page])
            end
        else 
            @tweets = @q.result(distinct: true).order("created_at DESC").page(params[:page])
        end
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
        @likes = @tweet.likes
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
