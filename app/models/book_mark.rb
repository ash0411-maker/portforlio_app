# frozen_string_literal: true

class BookMark < ApplicationRecord
  belongs_to :tourist
  belongs_to :tour
end
