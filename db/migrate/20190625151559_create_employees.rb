class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.integer :old_employee_id
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :email
      t.string :office_phone
      t.string :cell_phone
      t.string :home_address_line1
      t.string :home_address_line2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
