class RemoveCellPhoneFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :cell_phone, :string
    remove_column :contacts, :personal_phone, :string
    remove_column :contacts, :fax, :string 
    remove_column :contacts, :office_phone, :string 
  end
end
