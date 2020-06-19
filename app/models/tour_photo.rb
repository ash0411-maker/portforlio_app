class TourPhoto < ApplicationRecord
  belongs_to :tour
  attachment :image
  validates :image, presence: true
end
