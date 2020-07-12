# frozen_string_literal: true

class Room < ApplicationRecord
  belongs_to :tourist
  belongs_to :guide
  has_many :chats, dependent: :destroy

  def self.match(model, room_id)
    Room.find_by(id: room_id) if model == 'room'
  end
end
