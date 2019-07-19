class AddColumnsToProjectContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :project_contacts, :old_project_id, :integer
    add_column :project_contacts, :old_contact_id, :integer
  end
end
