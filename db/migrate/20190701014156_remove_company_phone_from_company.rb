class RemoveCompanyPhoneFromCompany < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :company_phone, :string
  end
end
