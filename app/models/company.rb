class Company < ActiveRecord::Base
  validates :name, :address, :email, :phone, :website, presence: true
  has_many :offices, dependent: :destroy
  has_many :rooms, through: :offices
  has_many :events, through: :rooms
  validates :name, uniqueness: true

  before_save { self.email = email.downcase }
  validates :email, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  def to_s
    name
  end
end
