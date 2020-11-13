class TweetsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index 
    end 

    def new 
        @tweet = Tweet.new
    end 

    def create 
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
