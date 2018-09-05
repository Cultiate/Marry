class Project < ApplicationRecord
  has_many :celebraters
  has_many :category_projects
  has_many :categories, through: :category_projects
  belongs_to :user
  mount_uploader :main_image, MainImageUploader
  mount_uploader :return_image_1, MainImageUploader
  mount_uploader :return_image_2, MainImageUploader
  mount_uploader :return_image_3, MainImageUploader
  validates :user_id, presence: true
  validates :content, presence: true
  validate  :main_image_size

  private

    def main_image_size
      if main_image.size > 5.megabytes
        errors.add(:main_image, "最大サイズ(5MB)を超えています。")
      end
    end
end
