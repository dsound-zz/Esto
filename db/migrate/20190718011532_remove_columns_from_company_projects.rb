class RemoveColumnsFromCompanyProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :company_projects, :old_company_id, :integer
    remove_column :company_projects, :old_project_id, :integer
  end
end
