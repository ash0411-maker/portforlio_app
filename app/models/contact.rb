# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :user_text, presence: true
end
