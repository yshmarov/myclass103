class Payment < ActiveRecord::Base
  belongs_to :guest
  belongs_to :sale
  belongs_to :office
end
