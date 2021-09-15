class Shop < ApplicationRecord
  has_one_attached :image
  has_many :reviews
  belongs_to :admin

end
