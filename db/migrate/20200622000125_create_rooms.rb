# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.timestamps
      t.integer 'tourist_id', null: false
      t.integer 'guide_id', null: false
    end
  end
end
