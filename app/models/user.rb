class User < ApplicationRecord
  # Set input password as variable then encrypt before validation
  attr_accessor :password
  before_validation :encrypt_password

  validates :name, presence: true
  # Add uniqueness checking
  validates :email, presence: true, uniqueness: true
  validates :crypted_password, presence: true
  validates :salt, presence: true

  def encrypt_password
    # Should has value only on registering
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.crypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  # Find user by email then check hash of input password
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.crypted_password == BCrypt::Engine.hash_secret(password, user.salt)
      return user
    else
      return nil
    end
  end

end
