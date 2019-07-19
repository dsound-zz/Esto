class RemoveColumnsFromEmployees < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :home_address_line1, :string
    remove_column :employees, :home_address_line2, :string
    remove_column :employees, :office_phone, :string
    remove_column :employees, :cell_phone, :string
    remove_column :employees, :city, :string 
    remove_column :employees, :state, :string 
    remove_column :employees, :zip, :string 
    
  end
end
