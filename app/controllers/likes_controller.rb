class LikesController < ApplicationController
    def create 
        @like = Like.create(like_params)
        @like.user_id = current_user.id 
        if @like.save
            redirect_to root_path
        else
            render root_path, notice: "Couldn't give a like"
        end
    end

    def like_params
        params.require(:like).permit(:id)
    end
end
