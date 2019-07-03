class AddPhoneCountryCodeToPhones < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :phone_country_code, :string
    add_column :phones, :phone_area_code, :string 
  end
end
