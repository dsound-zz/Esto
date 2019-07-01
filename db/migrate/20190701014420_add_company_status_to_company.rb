class AddCompanyStatusToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :company_status, :boolean
  end
end
