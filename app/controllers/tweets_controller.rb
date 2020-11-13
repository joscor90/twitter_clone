class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index 
        @tweets = Tweet.all
    end 

    def new 
        @tweet = Tweet.new
    end 

    def create 
        @tweet = Tweet.create(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            redirect_to :index, notice: 'Tweet was created successfully'
        else 
            render :new 
        end
    end 

    def show 
    end 

    def edit 
    end

    def update  
    end 

    def destroy 
    end

    private 

    def tweet_params 
        params.require(:tweet).permit(:content)
    end

end
