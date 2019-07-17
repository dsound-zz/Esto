class AddColumnToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :image_number, :string
    add_column :images, :file_size, :string
    add_column :images, :keywords, :string
  end
end
