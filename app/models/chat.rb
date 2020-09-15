# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :room
  belongs_to :guide
  belongs_to :toursit
  has_many :chat_notices, dependent: :destroy
  validates :message, presence: true
end
