
class User < ApplicationRecord
  has_secure_password
  include ActiveModel::ForbiddenAttributesProtection

  validates :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true

end
