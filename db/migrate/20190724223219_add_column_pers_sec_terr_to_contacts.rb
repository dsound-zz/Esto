class AddColumnPersSecTerrToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :pers_secTerr, :integer
  end
end
