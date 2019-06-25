class Company < ApplicationRecord
   has_many company_projects
   has_many contacts
   has_one :address, as: :addressable, polymorphic: true 
end
