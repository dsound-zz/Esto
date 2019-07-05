class RemoveAddressableTypeFromInvoices < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoices, :addressable_type, :string
     remove_column :invoices, :addressable_id, :integer
  end
end
