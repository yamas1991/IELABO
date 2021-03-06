class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :shop

  validates :title, :body, :evaluation, presence: true

end
