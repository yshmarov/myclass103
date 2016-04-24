class Service < ActiveRecord::Base
  before_destroy :check_for_associations
  belongs_to :service_name
  has_many :event_groups
  has_many :enrollments
  #has_many :enrollments, through: :event_groups
  has_many :events, through: :event_groups
  has_many :attendances, through: :events
  validates :service_name_id, :event_quantity, :event_length, :uprice, :gprice, :gtype, :ctype, presence: true
  def name
  	event_quantity.to_s + service_name.to_s + event_length.to_s + gtype.to_s + totalprice.to_s 
  end
  def to_s
    name
  end
  
  def totalprice
  	event_quantity * gprice
  end

  def self.active
    where(is_active: true)
  end

  def self.inactive
    where(is_active: false)
  end

  def self.active_or_id(record_id)
    where('id = ? OR (is_active=1)', record_id)    
  end

  def event_groups?
    event_groups.any?
  end

  private
  def check_for_associations
    if event_groups?
      errors[:base] << "cannot delete : events are still planned"
      false
    end
  end

end
