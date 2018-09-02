class Project < ApplicationRecord
  has_many :category_projects
  has_many :categories, through: :category_projects
  belongs_to :user
  mount_uploader :main_image, PictureUploader
  mount_uploader :return_image_1, PictureUploader
  mount_uploader :return_image_2, PictureUploader
  mount_uploader :return_image_3, PictureUploader
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
