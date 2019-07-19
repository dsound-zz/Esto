class RemoveColumnFromEmails < ActiveRecord::Migration[5.2]
  def change
    remove_column :emails, :contact_id, :integer
  end
end
