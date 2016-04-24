class Payment < ActiveRecord::Base
  belongs_to :guest
  belongs_to :enrollment
  belongs_to :office
end
