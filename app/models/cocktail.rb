
class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name, presence: true, uniqueness: true,  allow_blank: false
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy

end
