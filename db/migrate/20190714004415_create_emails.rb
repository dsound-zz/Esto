class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.integer :email_link_id
      t.string :email_address
      t.string :email_type
      t.string :email_deleted
      t.string :email_intforeignid
      t.string :email_intid
      t.integer :contact_id

      t.timestamps
    end
  end
end
