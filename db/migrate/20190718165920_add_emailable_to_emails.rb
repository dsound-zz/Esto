class AddEmailableToEmails < ActiveRecord::Migration[5.2]
  def change
    add_reference :emails, :emailable, polymorphic: true
  end
end
