# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :tourist
  belongs_to :guide
  validates :total_people, presence: true

  enum status: { ツアー開始前: 0, ツアー前日: 1, ツアー当日: 2, ツアー終了: 3, レビュー済み: 4 }

  def self.match(model, order_id)
    Order.find_by(id: order_id) if model == 'order'
  end
end
