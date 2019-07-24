class Employee < ApplicationRecord
    has_many :employee_projects
    has_many :projects, through: :employee_projects
    has_many :phones, as: :phonable, dependent: :destroy 
    has_many :emails, as: :emailable, dependent: :destroy 
    has_many :addresses, as: :addressable, dependent: :destroy


    validates_presence_of :first_name, :last_name, :role 
   
end
