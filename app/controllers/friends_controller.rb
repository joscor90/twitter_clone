class FriendsController < ApplicationController
    def create 
        friend_id = params.require(:user_id)
        user_to_be_friend = User.find_by(id: friend_id)
        @friend = Friend.create(user_id: current_user.id, friend_id: user_to_be_friend.id)
        @friend.save
    end
end
