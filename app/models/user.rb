class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :crypted_password, presence: true
  validates :salt, presence: true
end
