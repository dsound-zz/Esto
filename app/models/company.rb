class Company < ApplicationRecord
   has_many :projects
   has_many :contacts
   has_many :addresses, as: :addressable, dependent: :destroy 
end
