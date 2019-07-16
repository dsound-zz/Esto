class RemoveFirstNameFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :first_name, :string
    remove_column :projects, :last_name, :string
    remove_column :projects, :role, :string 
    remove_column :projects, :email, :string
    remove_column :projects, :office_phone, :string
    remove_column :projects, :cell_phone, :string
    remove_column :projects, :company_id, :string 
   
  end
end
