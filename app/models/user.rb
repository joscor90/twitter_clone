class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :retweets, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def to_s 
    self.name
  end
end
