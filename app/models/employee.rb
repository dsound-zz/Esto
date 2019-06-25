class Employee < ApplicationRecord
    has_many :emplyee_projects
    has_many :projects, through: :employee_projects
end
