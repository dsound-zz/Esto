class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :old_company_id
      t.string :name
      t.string :company_phone
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
