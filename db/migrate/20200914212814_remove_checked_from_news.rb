class RemoveCheckedFromNews < ActiveRecord::Migration[6.0]
  def up
    remove_column :news, :checked
  end

  def down
    add_column :news, :checked, :boolean
  end
end
