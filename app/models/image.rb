class Image < ApplicationRecord
    has_many :project_images
    has_many :projects, through: :project_images
end
