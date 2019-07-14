class ChangeAddressTypeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address_type
    add_column :addresses, :address_type, :boolean, default: true
  end
end
