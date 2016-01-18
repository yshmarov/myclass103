class Room < ActiveRecord::Base
  belongs_to :office
  def to_s
    name
  end
end
