class ChangePhoneNumberToPhoneNumInPhones < ActiveRecord::Migration[5.2]
  def change
    rename_column :phones, :phone_number, :phone_num 
  end
end
