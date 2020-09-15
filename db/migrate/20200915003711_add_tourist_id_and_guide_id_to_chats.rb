class AddTouristIdAndGuideIdToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :tourist_id, :integer
    add_column :chats, :guide_id, :integer
  end
end
