class AddOldIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :old_address_id, :integer
  end
end
