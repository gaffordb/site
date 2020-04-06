class User < ApplicationRecord
  has_secure_password
  validates :fingerprint, presence:true, uniqueness: true
  validates :name, length: { maximum: 1000000 }
end
