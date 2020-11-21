class FriendsController < ApplicationController
    def create 
        followed_user = params.require(:user_id)
        followed_user_name = User.find_by(id: followed_user)
        @friend = Friend.create(user_id: current_user.id, friend_id: followed_user)
        if @friend.save
            redirect_to root_path, notice: "You are know following #{followed_user_name}"
        end
    end
end
