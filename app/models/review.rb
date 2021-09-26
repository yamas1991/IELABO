class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :shop

    validates :shop, presence: true

end
