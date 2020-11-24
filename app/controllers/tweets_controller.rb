class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    attr_reader :ref_tweet

    def search_tweet(tweet)
        ref_retweet = Retweet.find_by(id: tweet.retweet_id)
        @ref_tweet = Tweet.find_by(id: ref_retweet.tweet_id)
        return @ref_tweet
    end

    def friend?(t_user_id)
        friend = User.find_by(id: t_user_id)
        current_user.friends.include?(Friend.find_by(user_id: current_user.id, friend_id: friend.id))
    end

    def liked?(tweet)
        tweet.likes.include?(Like.find_by(user_id: current_user.id, tweet_id: tweet.id))
    end

    def retweeted?(tweet)
        tweet.retweets.include?(Retweet.find_by(user_id: current_user.id, tweet_id: tweet.id)) 
    end

    def hashtag_filter(content)
        content_arr = content.split(" ")
        new_content_arr = content_arr.map do |w|
            if w[0] == "#"
                if (/\W/).match(w[-1])  
                    w_arr = w.split("")
                    w_arr = w.split("")
                    del_char = w_arr.pop
                    w = w.delete(w[-1]) 
                    w = "<a href=\"/hashtags/#{w.delete(w[0])}\"> "+w+" </a>"+del_char
                else 
                    w = "<a href=\"/hashtags/#{w.delete(w[0])}\"> "+w+" </a>"
                end
            else
                w 
            end
        end
        return (new_content_arr.join(" ")).html_safe
    end

    helper_method :search_tweet, :liked?, :retweeted?, :friend?, :hashtag_filter

    def hashtags 
        hashtag = params.require(:hashtag)
        hashtag = "##{hashtag}"
        @hastag_tweets = []
        tweets = Tweet.all 
        tweets.each do 
    end

    def index
        @q = Tweet.ransack(params[:q])
        if user_signed_in?
            @tweet = Tweet.new
            frens = current_user.friends.pluck(:friend_id)
            if frens.empty?
                @tweets = @q.result(distinct: true).order("created_at DESC").page(params[:page])
            else 
                @tweets = @q.result(distinct: true).tweets_for_me(frens).order("created_at DESC").page(params[:page])
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
