class Office < ActiveRecord::Base
  belongs_to :company
  has_many :rooms
  has_many :events, through: :rooms
  def to_s
    name
  end
end
