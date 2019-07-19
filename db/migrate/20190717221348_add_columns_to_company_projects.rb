class AddColumnsToCompanyProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :company_projects, :old_company_id, :integer
    add_column :company_projects, :old_project_id, :integer
  end
end
