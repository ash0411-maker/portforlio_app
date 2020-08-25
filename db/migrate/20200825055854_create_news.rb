class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|

      t.timestamps
      t.integer 'tourist_id'
      t.integer 'guide_id'
      t.integer 'tour_id', null: false
      t.string 'action', null: false
      t.boolean 'checked', default: false, null: false
    end
  end
end
