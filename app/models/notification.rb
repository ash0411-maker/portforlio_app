class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :tour, optional: true
  belongs_to :review, optional: true
  belongs_to :tourist
  belongs_to :guide
end
