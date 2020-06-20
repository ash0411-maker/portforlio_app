# frozen_string_literal: true

class City < ApplicationRecord
  has_many :tours, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.match(city_name)
    City.find_by('(name LIKE ? )', "%#{city_name}%")
  end
end
