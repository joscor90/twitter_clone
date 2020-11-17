class ApplicationController < ActionController::Base
    attr_reader :ref_tweet

    def search_tweet(t)
        ref_retweet = Retweet.find_by(id: t.retweet_id)
        @ref_tweet = Tweet.find_by(id: ref_retweet.tweet_id)
        return @ref_tweet
    end

    helper_method :search_tweet
end
