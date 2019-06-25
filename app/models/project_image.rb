class ProjectImage < ApplicationRecord
    belongs_to :image 
    belongs_to :project 
end
