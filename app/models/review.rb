class Review < ApplicationRecord
  belongs_to :tour
  belongs_to :tourist

  validates :comment, presence: true, length: { maximum: 400 }
end
