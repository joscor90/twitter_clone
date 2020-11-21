class FriendsController < ApplicationController
    def create 
        friend_id = params.require(:user_id)
        user_to_be_friend = User.find_by(id: friend_id)
        @friend = Friend.create(user_id: current_user.id, friend_id: user_to_be_friend.id)
        if @friend.save
            redirect_to root_path, notice: "#{user_to_be_friend.name} is your friend!"
        end
    end
end
