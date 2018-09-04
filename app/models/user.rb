class User < ApplicationRecord
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_save :downcase_email
  has_many :projects

  private

  def downcase_email
    self.email = email.downcase
  end
end
