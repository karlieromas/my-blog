class User < ApplicationRecord
  validates :username, :email, :encrypted_password, presence: true
  validates :email, :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @plain_text_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  def validate_password
    if @plain_text_password.nil?
      errors.add(:password, "is required")
    elsif
      @plain_text_password.length < 6
      errors.add(:password, "must be at least 6 characters")
    end
  end

end
