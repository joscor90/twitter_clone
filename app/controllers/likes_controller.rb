class LikesController < ApplicationController
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
        @like = Like.find(user_id: current_user.id, tweet_id: params[:id])
        @like.destroy
        redirect_to root_path
    end
end
