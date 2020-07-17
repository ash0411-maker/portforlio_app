# frozen_string_literal: true

class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :tour
  belongs_to :tourist
  belongs_to :review, optional: true
  belongs_to :guide
end
