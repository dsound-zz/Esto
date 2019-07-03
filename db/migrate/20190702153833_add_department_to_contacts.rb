class AddDepartmentToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :department, :string
  end
end
