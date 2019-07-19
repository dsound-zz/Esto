class RemoveColumnsFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :company, :string
    remove_column :projects, :company_id, :string
  end
end
