class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.string :old_phone_id
      t.string :phone_type
      t.string :phone_number
      t.string :phone_initid
      t.string :contact_id

      t.timestamps
    end
  end
end
