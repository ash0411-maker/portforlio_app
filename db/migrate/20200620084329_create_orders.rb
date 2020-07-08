# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.timestamps
      t.integer 'status', default: 0
      t.integer 'tourist_id', null: false
      t.integer 'tour_id', null: false
      t.integer 'guide_id', null: false
      t.string 'tour_title', null: false
      t.text 'tour_body', null: false
      t.integer 'tour_capacity', null: false
      t.string 'tour_contents_of_price', null: false
      t.string 'tour_time', null: false
      t.string 'tour_city', null: false
      t.string 'tour_genre', null: false
      t.integer 'tour_price', null: false
      t.datetime 'tour_date', null: false
      t.integer 'total_people', null: false
      t.integer 'total_price', null: false
      t.integer 'admin_sales', null: false
      t.integer 'guide_sales', null: false
    end
  end
end
