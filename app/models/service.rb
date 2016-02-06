class Service < ActiveRecord::Base
  belongs_to :service_name
  has_many :event_groups
  def name
  	event_quantity.to_s + service_name.to_s + event_length.to_s + gtype.to_s + totalprice.to_s 
  end
  def to_s
    name
  end
  def totalprice
  	event_quantity * gprice
  end
end
