class Room < ApplicationRecord
    belongs_to :tourist
    belongs_to :guide
    has_many :chats, dependent: :destroy

    def self.match(model, room_id)
        if model == 'room'
            Room.find_by(id: room_id)
        end
    end
end
