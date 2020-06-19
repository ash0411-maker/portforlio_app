# frozen_string_literal: true

class Genre < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :tours, dependent: :destroy
end
