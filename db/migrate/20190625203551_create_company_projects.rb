class CreateCompanyProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :company_projects do |t|
      t.integer :company_id
      t.integer :project_id

      t.timestamps
    end
  end
end
