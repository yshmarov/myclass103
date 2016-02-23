class Guest < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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
