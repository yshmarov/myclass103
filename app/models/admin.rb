class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cash_collections
  def to_s
    self.email.split(/@/).first
  end
  def username
    self.email.split(/@/).first
  end
end
