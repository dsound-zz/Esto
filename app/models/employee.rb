class Employee < ApplicationRecord
    has_many :employee_projects
    has_many :projects, through: :employee_projects
    has_one :phone, as: :phonable, dependent: :destroy 
    has_one :emails, as: :emaiable, dependent: :destroy 
    has_one :address, as: :addressable, dependent: :destroy
end
