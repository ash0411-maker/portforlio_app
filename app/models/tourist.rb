# frozen_string_literal: true

class Tourist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :rooms, dependent: :destroy
  has_many :book_marks, dependent: :destroy
  has_many :tourist_active_notices, class_name: 'ChatNotice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :tourist_passive_notices, class_name: 'ChatNotice', foreign_key: 'visited_id', dependent: :destroy
end
