class RemoveEmailFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :office_email, :string
    remove_column :contacts, :personal_email, :string
    remove_column :contacts, :facetime, :string
  end
end
