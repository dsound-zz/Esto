class AddColumnEmailTypeToEmails < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :email_type, :string
  end
end
