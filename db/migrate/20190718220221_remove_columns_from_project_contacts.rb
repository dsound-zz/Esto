class RemoveColumnsFromProjectContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_contacts, :old_project_id, :string
    remove_column :project_contacts, :old_contact_id, :string
  end
end
