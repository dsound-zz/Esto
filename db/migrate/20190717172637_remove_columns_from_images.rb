class RemoveColumnsFromImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :file_num, :string
    remove_column :images, :size, :string
    remove_column :images, :location, :string
    remove_column :images, :old_image_id, :string
  end
end
