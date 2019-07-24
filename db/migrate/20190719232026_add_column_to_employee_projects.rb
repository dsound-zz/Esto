class AddColumnToEmployeeProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :employee_projects, :old_employee_id, :integer
    add_column :employee_projects, :old_project_id, :integer
  end
end
