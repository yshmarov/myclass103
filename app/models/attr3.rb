class Attr3 < ActiveRecord::Base
  has_many :event_groups
  validates :name, uniqueness: true, presence: true
  def to_s
    name
  end

end
