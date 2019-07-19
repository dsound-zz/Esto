class Company < ApplicationRecord
   has_many :projects
   has_one :address, as: :addressable, dependent: :destroy 
end
