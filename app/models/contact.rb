class Contact < ApplicationRecord
    has_many :project_contacts
    has_many :project_contacts, through: :project_contacts
    belongs_to :company
    has_one :address, as: :addressable, polymorphic: true 

end
