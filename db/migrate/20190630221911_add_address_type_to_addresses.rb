class AddAddressTypeToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address_type, :boolean
  end
end
