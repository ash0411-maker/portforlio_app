# frozen_string_literal: true

class Guide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  
  has_many :orders, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :guide_active_notices, class_name: 'ChatNotice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :guide_passive_notices, class_name: 'ChatNotice', foreign_key: 'visited_id', dependent: :destroy
  

  validates :introduction, length: { maximum: 400 }

  attachment :selfy_image
  attachment :identification_image
end
