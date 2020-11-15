class LikesController < ApplicationController
    
    def index 
        @likes = Like.where("tweet_id = ?", params[:id])
    end
    def create 
        @like = Like.create(tweet_id: params[:id])
        @like.user_id = current_user.id 
        if @like.save
            redirect_to root_path
        else
            render root_path, notice: "Couldn't give a like"
        end
    end

    def destroy 
        @like = Like.find_by(user_id: current_user.id, tweet_id: params[:id])
        @like.destroy if @like
        redirect_to root_path
    end
end
