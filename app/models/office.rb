class Office < ActiveRecord::Base
  belongs_to :company
  def to_s
    name
  end
end
