class CreateChatNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_notices do |t|

      t.timestamps
      t.integer 'visitor_id', null: false
      t.integer 'visited_id', null: false
      t.boolean 'checked', default: false, null: false
      t.integer 'chat_id', null: false
    end
  end
end
