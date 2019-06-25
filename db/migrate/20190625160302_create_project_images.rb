class CreateProjectImages < ActiveRecord::Migration[5.2]
  def change
    create_table :project_images do |t|
      t.integer :image_id
      t.integer :project_id

      t.timestamps
    end
  end
end
