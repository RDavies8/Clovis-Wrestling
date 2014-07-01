class User < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def correct_password? test_password
    return true if test_password == self.city
    return false
  end

  def full_name
    "#{first_name} #{last_name}"
  end


end
