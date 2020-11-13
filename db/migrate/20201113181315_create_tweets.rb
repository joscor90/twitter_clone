class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.integer :retweet, default: 0

      t.timestamps
    end
  end
end
