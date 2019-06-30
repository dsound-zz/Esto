class Invoice < ApplicationRecord
    belongs_to :project 
    has_one :address, as: :addressable
end
