class User < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  before_save :encrypt_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true

  validates :username, presence: true, uniqueness: true, length: {minimum: 4, maximum: 10}
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  def correct_password?(test_password)
    test_hash = Digest::SHA2.hexdigest(test_password + password_salt)
    if password_hash == test_hash
      return true
    else
      return false
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = SecureRandom.hex
      self.password_hash = Digest::SHA2.hexdigest(password + password_salt)
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def password
    @password
  end

  def password=(value)
    @password = value
  end


end
