class ServiceName < ActiveRecord::Base
  before_destroy :check_for_associations
  has_many :services
  validates :name, presence: true
  def to_s
	name
  end

  def services?
  	services.any?
  end
  private
  def check_for_associations
    if services?
      errors[:base] << "cannot delete : events are still planned"
      false
    end
  end

end
