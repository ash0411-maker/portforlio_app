# frozen_string_literal: true

class Guide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :tours, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :chats, through: :rooms
  has_many :notifications, dependent: :destroy
  has_many :guide_active_notices, class_name: 'ChatNotice', foreign_key: 'visitor_id', dependent: :destroy
  has_many :guide_passive_notices, class_name: 'ChatNotice', foreign_key: 'visited_id', dependent: :destroy

  validates :introduction, length: { maximum: 400 }

  attachment :selfy_image
  attachment :identification_image

  def self.match(model, guide_id)
    Guide.find_by(id: guide_id) if model == 'guide'
  end

  def full_name
    "#{family_name} #{name}"
  end

  def personal_info_not_filled
    family_name.blank? || name.blank? || nationality.blank? ||
        identification_image_id.blank? || postal_code.blank? || address.blank? ||
        phone_number.blank? || introduction.blank? || selfy_image_id.blank?
  end
end
