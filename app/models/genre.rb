class Genre < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
