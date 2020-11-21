class Tweet < ApplicationRecord
  #Aqui va el scope
  belongs_to :user
  has_many :retweets
  has_many :likes
  validates :content, presence: true
  delegate :image_url, to: :user, prefix: 'user'
end
