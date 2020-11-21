class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    attr_reader :ref_tweet

    def search_tweet(tweet)
        ref_retweet = Retweet.find_by(id: tweet.retweet_id)
        @ref_tweet = Tweet.find_by(id: ref_retweet.tweet_id)
        return @ref_tweet
    end

    def followed?(tweet)
        followed_user = User.find_by(id: tweet.user_id)
        followed_user.friends.include?(friend_id: current_user.id)
    end

    def liked?(tweet)
        tweet.likes.include?(Like.find_by(user_id: current_user.id, tweet_id: tweet.id))
    end

    def retweeted?(tweet)
        tweet.retweets.include?(Retweet.find_by(user_id: current_user.id, tweet_id: tweet.id)) 
    end

    helper_method :search_tweet, :liked?, :retweeted?, :followed?

    def index 
        @tweet = Tweet.new
        @tweets = Tweet.order("created_at DESC").page(params[:page])
    end 

    def new
        @tweet = Tweet.new
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
