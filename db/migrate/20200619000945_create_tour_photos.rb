class CreateTourPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_photos do |t|

      t.timestamps
      t.string 'image_id', null: false
      t.integer 'tour_id', null: false
    end
  end
end
