def remap_old_associations(table, association_column, associated_table)
  ActiveRecord::Base.connection.execute(<<~SQL)

WITH companies_id_map AS (
  SELECT companies.id, companies.old_company_id
  FROM companies
)
UPDATE contacts
SET company_id = companies_id_map.id
FROM companies_id_map
WHERE contacts.old_company_id = companies_id_map.old_company_id

SQL
end 

remap_old_associations :companies, :company_id, :contacts