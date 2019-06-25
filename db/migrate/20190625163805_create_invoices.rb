class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :old_invoice_id
      t.string :name
      t.string :company_phone
      t.integer :project_id
      t.references :addressable, polymorphic: true 

      t.timestamps
    end
  end
end
