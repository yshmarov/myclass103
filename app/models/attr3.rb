class Attr3 < ActiveRecord::Base
	has_many :event_groups
	def to_s
		name
	end

end
