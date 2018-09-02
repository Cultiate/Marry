class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  before_save :downcase_email
  has_many :projects

  private

  def downcase_email
    self.email = email.downcase
  end
end
