class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :old_contact_id
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :office_email
      t.string :personal_email
      t.string :facetime
      t.string :office_phone
      t.string :cell_phone
      t.string :personal_phone
      t.string :fax
      t.integer :comapny_id
      t.references :addressable, polymorphic: true 

      t.timestamps
    end
  end
end
