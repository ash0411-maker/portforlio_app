# frozen_string_literal: true

class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.timestamps
      t.integer 'genre_id', null: false
      t.integer 'guide_id', null: false
      t.integer 'city_id', null: false
      t.string 'title', null: false
      t.text 'body', null: false
      t.integer 'capacity', null: false
      t.integer 'price', null: false
      t.string 'contents_of_price', null: false
      t.boolean 'is_active', default: true
      t.string 'time', null: false
      t.string 'meetingpoint_address', null: false
      t.string 'meetingpoint_introduction', null: false
      t.float 'latitude'
      t.float 'longitude'
    end
  end
end
