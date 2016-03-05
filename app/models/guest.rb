class Guest < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :validatable, :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable
  has_many :attendances
  has_many :events, through: :attendances
  has_many :event_groups, through: :events
  has_many :services, through: :event_groups
  def to_s
    self.email.split(/@/).first
  end
  def username
    self.email.split(/@/).first
  end

end
