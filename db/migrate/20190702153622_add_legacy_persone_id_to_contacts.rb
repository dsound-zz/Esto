class AddLegacyPersoneIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :legacy_personid, :string
  end
end
