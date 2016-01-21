class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :event_group
  def ends_at
  	starts_at + duration*60
  end	
end
