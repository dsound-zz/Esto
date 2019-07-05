class RemoveAddressableTypeFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :addressable_type, :string
    remove_column :contacts, :addressable_id, :integer
  end
end
