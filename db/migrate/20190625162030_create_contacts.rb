class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :old_contact_id
      t.integer :old_address_id
      t.integer :old_company_id
      t.integer :old_email_id
      t.integer :legacy_personid
      t.string :source 
      t.integer :pers_secTerr
      t.datetime :pers_ConflictResDate
      t.string :title 
      t.string :first_name
      t.string :last_name
      t.integer :comapny_id


      t.timestamps
    end
  end
end
