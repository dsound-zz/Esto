def remap_old_associations(table, association_column, associated_table)
  ActiveRecord::Base.connection.execute(<<~SQL)

WITH companies_id_map AS (
  SELECT companies.id, companies.old_company_id
  FROM companies
)
UPDATE addresses
SET addressable_id = companies_id_map.id, addressable_type = 'Company'
FROM companies_id_map
WHERE addresses.old_address_id = companies_id_map.old_company_id

SQL
end 

remap_old_associations :companies, :addressable_id, :addresses