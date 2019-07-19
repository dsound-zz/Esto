class RemoveColumnFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :library_dir, :string
  end
end
