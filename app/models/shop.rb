class Shop < ApplicationRecord
  has_one_attached :image
  has_many :reviews

  validates :shopname, :address, :opentime, presence: true

end
