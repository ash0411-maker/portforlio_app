# frozen_string_literal: true

class Tour < ApplicationRecord
  belongs_to :guide, optional: true
  belongs_to :genre, optional: true
  belongs_to :city, optional: true
  has_many :tour_photos, dependent: :destroy
  accepts_nested_attributes_for :tour_photos, allow_destroy: true

  validates :genre_id, presence: true
  validates :city_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 800 }
  validates :meetingpoint_introduction, presence: true, length: { maximum: 400 }
  validates :meetingpoint_address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :contents_of_price, presence: true
  validates :time, presence: true
end
