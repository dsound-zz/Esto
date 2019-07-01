class AddLibDirectorToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :library_dir, :string
  end
end
