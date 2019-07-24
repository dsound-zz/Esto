class Contact < ApplicationRecord
    has_many :project_contacts
    has_many :projects, through: :project_contacts
    belongs_to :company
    has_many :phones, as: :phonable, dependent: :destroy 
    has_many :emails, as: :emailable, dependent: :destroy 
    has_many :addresses, as: :addressable, dependent: :destroy
end
