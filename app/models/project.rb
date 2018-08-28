class Project < ApplicationRecord
  has_many :category_projects
  has_many :categories, through: :category_projects
  belongs_to :user
end
