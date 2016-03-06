class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  has_many :events
  has_many :expences
  has_many :event_groups, through: :events
  has_many :attendances, through: :events
  has_many :services, through: :event_groups

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

#  def to_param
#    "#{id} #{username}".to_slug.normalize.to_s
#  end

end
