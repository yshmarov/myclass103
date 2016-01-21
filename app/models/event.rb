class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :event_group

end
