class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|

      t.timestamps
      t.integer 'room_id', null: false
      t.boolean 'is_tourist', null: false
      t.text 'message', null: false
    end
  end
end
