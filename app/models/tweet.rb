class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets
  has_many :likes
  validates :content, presence: true
end
