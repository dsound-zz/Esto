class AddPhoneExtToPhones < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :phone_ext, :string
  end
end
