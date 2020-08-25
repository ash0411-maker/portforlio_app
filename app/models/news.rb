class News < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    belongs_to :tour
    belongs_to :tourist, optional: true
    belongs_to :guide, optional: true
end
