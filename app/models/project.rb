class Project < ApplicationRecord
    has_many :project_images 
    has_many :images, through: :project_images 
    has_many :project_contacts 
    has_many :contacts, through: :project_contacts 
    has_many :invoices
    belongs_to :company
end
