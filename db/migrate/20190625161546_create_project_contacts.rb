class CreateProjectContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :project_contacts do |t|
      t.integer :project_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
