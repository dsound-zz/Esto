class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :old_image_id
      t.string :file_num
      t.string :caption
      t.string :location
      t.string :photographer
      t.string :size

      t.timestamps
    end
  end
end
