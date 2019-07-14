class AddOldAddressIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :old_address_id, :string
  end
end
