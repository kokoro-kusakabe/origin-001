class Tweet < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text, length: { maximum: 50 }
    validates :image, length: { maximum: 140 }
  end

  belongs_to :user
  has_one_attached :image
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
end
