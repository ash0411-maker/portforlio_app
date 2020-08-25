class News < ApplicationRecord
    belongs_to :tour
    belongs_to :tourist, optional: true
    belongs_to :guide, optional: true
end
