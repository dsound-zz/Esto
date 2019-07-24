class AddColumnToProjectImages < ActiveRecord::Migration[5.2]
  def change
    add_column :project_images, :image_number, :string
    add_column :project_images, :old_project_id, :integer 
  end
end
