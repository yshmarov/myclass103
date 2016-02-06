class Service < ActiveRecord::Base
  belongs_to :service_name
  has_many :event_groups
  def to_s
  	event_quantity.to_s + service_name.to_s + event_length.to_s
  end
end
