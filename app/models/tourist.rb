# frozen_string_literal: true

class Tourist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  acts_as_paranoid

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :news, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :tourist_active_notices, class_name: 'ChatNotice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :tourist_passive_notices, class_name: 'ChatNotice', foreign_key: 'visited_id', dependent: :destroy

  def self.match(model, tourist_id)
    Tourist.find_by(id: tourist_id) if model == 'tourist'
  end
end
