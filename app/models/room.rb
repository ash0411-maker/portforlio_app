class Room < ApplicationRecord
    belongs_to :tourist
    belongs_to :guide
    has_many :chats, dependent: :destroy
end
