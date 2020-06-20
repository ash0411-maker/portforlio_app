class Order < ApplicationRecord
    belongs_to :tourist
    belongs_to :guide
    validates :total_people, presence: true

    enum status: { ツアー開始前: 0, ツアー前日: 1, ツアー当日: 2, ツアー終了: 3, レビュー済み: 4 }
end
