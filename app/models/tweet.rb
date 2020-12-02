class Tweet < ApplicationRecord
  #Aqui va el scope
  scope :tweets_for_me, ->(friend_list, current_user_id) { where(:user_id => (friend_list).push(current_user_id)) }
  scope :created_between, -> (start_date, end_date) { where("created_at BETWEEN ? AND ?", start_date, end_date) }

  belongs_to :user
  has_many :retweets
  has_many :likes
  validates :content, presence: true
  delegate :image_url, to: :user, prefix: 'user'

  def likes_count
    self.likes.count
  end

  def retweets_count
    self.retweets.count 
  end
end
