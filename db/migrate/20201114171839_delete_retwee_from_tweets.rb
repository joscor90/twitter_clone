class DeleteRetweeFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :retweet
  end
end
