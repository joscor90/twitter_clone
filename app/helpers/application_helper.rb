module ApplicationHelper

    attr_reader :ref_tweet
    
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

    def search_tweet(tweet)
        ref_retweet = Retweet.find_by(id: tweet.retweet_id)
        @ref_tweet = Tweet.find_by(id: ref_retweet.tweet_id)
        return @ref_tweet
    end

    def hashtag_filter(content)
        content_arr = content.split(" ")
        new_content_arr = content_arr.map do |w|
            if w[0] == "#"
                w = "<a href=\"/hashtags/#{w.delete(w[0])}\"> "+w+" </a>"
            else
                w 
            end
        end
        return (new_content_arr.join(" ")).html_safe
    end

    def hashtags 
        hashtag = params.require(:hashtag)
        @hashtag = "#{hashtag.gsub(/\W/,"")}"
        @hashtag_tweets = []
        tweets = Tweet.all
        tweets.each do |tweet|
            content_arr  = tweet.content.split(" ")
            content_arr.each do |w| 
                if w[0] == "#"
                    if w.gsub(/\W/, "") == @hashtag
                        @hashtag_tweets.push(tweet)
                    end
                end
            end
        end
    end
end
