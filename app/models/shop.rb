class Shop < ApplicationRecord
  attachment :image
  has_many :reviews
  belongs_to :admin

end
