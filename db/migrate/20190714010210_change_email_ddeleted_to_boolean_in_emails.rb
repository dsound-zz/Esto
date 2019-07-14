class ChangeEmailDdeletedToBooleanInEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :emails, :email_type
    add_column :emails, :email_type, :boolean 
  end
end
