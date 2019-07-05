class RemoveAddressableTypeFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :addressable_type, :string
    remove_column :companies, :addressable_id, :integer 
  end
end
