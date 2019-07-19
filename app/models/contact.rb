class Contact < ApplicationRecord
    has_many :project_contacts
    has_many :projects, through: :project_contacts
    has_one :phone, as: :phonable, dependent: :destroy 
    has_one :emails, as: :emaiable, dependent: :destroy 
    has_one :address, as: :addressable, dependent: :destroy
end
