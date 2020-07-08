# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.timestamps
      t.string 'name', null: false
      t.string 'email', null: false
      t.text 'user_text', null: false
      t.text 'admin_text'
    end
  end
end
