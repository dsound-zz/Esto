class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :old_project_id
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :email
      t.string :office_phone
      t.string :cell_phone
      t.string :company_id

      t.timestamps
    end
  end
end
