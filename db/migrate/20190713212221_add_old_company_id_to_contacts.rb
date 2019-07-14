class AddOldCompanyIdToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :old_company_id, :string
  end
end
