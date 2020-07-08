# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.timestamps
      t.text 'comment', null: false
      t.integer 'tourist_id', null: false
      t.integer 'tour_id', null: false
    end
  end
end
