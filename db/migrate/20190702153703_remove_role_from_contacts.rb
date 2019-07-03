class RemoveRoleFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :role, :string
  end
end
