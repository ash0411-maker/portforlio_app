# frozen_string_literal: true

class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.timestamps
      t.string 'name', null: false
    end
  end
end
