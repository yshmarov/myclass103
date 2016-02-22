class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  has_many :expences
  has_many :event_groups, through: :events
  has_many :services, through: :event_groups
  def to_s
    email
  end
 def username
    self.email.split(/@/).first
  end

#  def to_param
#    "#{id} #{username}".to_slug.normalize.to_s
#  end

end
