class AddOldAddressIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :old_address_id, :integer
  end
end
