# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :tour
  belongs_to :tourist
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 400 }
end
