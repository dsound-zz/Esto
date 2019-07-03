class AddLegacyCompIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :legacy_compid, :string
  end
end
