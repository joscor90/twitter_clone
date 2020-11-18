class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  delegate :image_url, to: :user, prefix: 'user'
end
