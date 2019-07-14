class ChangeCompanyIdToOldCompanyIdInContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :company_id
  end
end
