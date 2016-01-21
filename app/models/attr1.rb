class Attr1 < ActiveRecord::Base
	has_many :event_groups
	def to_s
		Attr1
	end
end
