class RenameInitForeignIdInPhones < ActiveRecord::Migration[5.2]
  def change
    rename_column :phones, :init_foreign_id, :phone_foreign_id
  end
end
