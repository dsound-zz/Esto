class ChangeEmailDeletedInEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :emails, :email_deleted
    add_column :emails, :email_deleted, :boolean 
  end
end
