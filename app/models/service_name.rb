class ServiceName < ActiveRecord::Base
  has_many :services
  validates :name, presence: true
  def to_s
	name
  end
end
