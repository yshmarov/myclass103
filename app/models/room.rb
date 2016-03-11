class Room < ActiveRecord::Base
  before_destroy :check_for_associations
  belongs_to :office
  has_many :events
  validates :name, :office_id, presence: true
  def to_s
    name
  end

  def events?
  	events.any?
  end
  private
  def check_for_associations
    if events?
      errors[:base] << "cannot delete : events are still planned"
      false
    end
  end

end
