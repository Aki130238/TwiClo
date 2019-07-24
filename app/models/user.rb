class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, on: :new
  validates :password, presence: true, length: { minimum: 6 }, on: :update, unless: Proc.new { |user| user.password.blank? }
  before_validation { email.downcase! }
  has_secure_password
  has_many :tweets
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
