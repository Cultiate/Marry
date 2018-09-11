class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_save :downcase_email
  has_many :projects
  mount_uploader :user_image, UserImageUploader

  def self.from_omniauth(auth)
    user = User.where('email = ?', auth.info.email).first
    if user.blank?
      user = User.new
    end
    user.uid   = auth.uid
    user.provider = auth.provider
    user.user_name  = auth.info.name
    user.email = auth.info.email
    user.user_image  = auth.info.image
    user.password = SecureRandom.urlsafe_base64
    user.password_confirmation = user.password
    user
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
