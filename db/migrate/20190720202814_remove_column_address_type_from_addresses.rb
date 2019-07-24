class RemoveColumnAddressTypeFromAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address_type, :string
  end
end
