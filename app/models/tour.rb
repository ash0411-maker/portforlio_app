# frozen_string_literal: true

class Tour < ApplicationRecord
  belongs_to :guide, optional: true
  belongs_to :genre, optional: true
  belongs_to :city, optional: true
  has_many :tour_photos, dependent: :destroy
  accepts_nested_attributes_for :tour_photos, reject_if: :all_blank, allow_destroy: true
end
