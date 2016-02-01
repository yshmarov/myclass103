class Attr2 < ActiveRecord::Base
	has_many :event_groups
	def to_s
		attr2
	end

end
