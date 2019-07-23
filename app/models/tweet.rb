class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belong_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
