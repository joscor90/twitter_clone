class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets
  validates :content, presence: true
end
