# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.timestamps
      t.integer 'review_id'
      t.integer 'tourist_id', null: false
      t.integer 'guide_id', null: false
      t.integer 'tour_id', null: false
      t.string 'action', null: false
      t.boolean 'checked', default: false, null: false
    end
  end
end
