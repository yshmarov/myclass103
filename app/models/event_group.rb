class EventGroup < ActiveRecord::Base
  belongs_to :attr1
  belongs_to :attr2
  belongs_to :attr3
  def to_s
  	name
  end
end