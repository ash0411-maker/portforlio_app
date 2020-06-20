# frozen_string_literal: true

class Guide < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tours, dependent: :destroy
  has_many :orders, dependent: :destroy

  attachment :selfy_image
  attachment :identification_image
end
