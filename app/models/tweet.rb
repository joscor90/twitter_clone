class Tweet < ApplicationRecord
  #Aqui va el scope
  scope :tweets_for_me, -> { where('user_id == ?', current_user.friends.pluck(:friend_id) }

  belongs_to :user
  has_many :retweets
  has_many :likes
  validates :content, presence: true
  delegate :image_url, to: :user, prefix: 'user'
end
