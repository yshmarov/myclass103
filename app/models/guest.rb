class Guest < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :validatable, :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  has_many :attendances
  has_many :events, through: :attendances
  has_many :event_groups, through: :events
  has_many :services, through: :event_groups
  has_many :comments

  before_save { self.email = email.downcase }
  validates :email, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, on: :create

  def to_s
    self.email.split(/@/).first
  end
  def username
    self.email.split(/@/).first
  end

end
