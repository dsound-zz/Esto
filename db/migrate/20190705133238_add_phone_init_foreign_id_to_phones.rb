class AddPhoneInitForeignIdToPhones < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :init_foreign_id, :integer
  end
end
