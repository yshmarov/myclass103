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
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  #validates_format_of :contact_1, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
  validates :contact_1, :contact_2,
                       :numericality => true,
                       :allow_blank => true,
                       :length => { :minimum => 5, :maximum => 13 }
  def to_s
    last_name+" "+first_name
  end
  def username
    self.email.split(/@/).first
  end

end
