class Tweet < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text, length: { minimum: 50 }
    validates :image, length: { minimum: 140 }
  end

  belongs_to :user
  has_one_attached :image
end
