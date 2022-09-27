class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  # validates :api_key, uniqueness: true, presence: true
  validates_presence_of :password

  has_secure_password

  after_validation :generate_api_key

  def generate_api_key
    self.update(api_key: SecureRandom.hex(25)) if !self.api_key
  end
end
