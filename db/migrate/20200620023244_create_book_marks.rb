# frozen_string_literal: true

class CreateBookMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :book_marks do |t|
      t.timestamps
      t.integer 'tourist_id', null: false
      t.integer 'tour_id', null: false
    end
  end
end
