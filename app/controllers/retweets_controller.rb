class RetweetsController < ApplicationController
    def index 
        @retweets = Retweet.all.where(tweet_id: params[:id])
    end 

    def new 
        ref_tweet = Tweet.find(params[:id].to_i)
        @tweet_id = ref_tweet.id
    end

    def create
        @tweet = Tweet.create(retweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            @retweet = Retweet.create(user_id: current_user.id, tweet_id: params[:id])
            @retweet.save
            @tweet.retweet_id = @retweet.id 
            @tweet.save 
            redirect_to root_path, notice: "Tweet was created successfully"
        else 
            render :new, notice: "Tweet couldn't be created"
        end
    end

    def retweet_params 
        params.require(:retweet).permit(:content)
    end
end
