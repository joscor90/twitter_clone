class Tweet < ApplicationRecord
  #Aqui va el scope
  scope :tweets_for_me, ->(friend_list) { where(:user_id => friend_list) }

  belongs_to :user
  has_many :retweets
  has_many :likes
  validates :content, presence: true
  delegate :image_url, to: :user, prefix: 'user'
end
