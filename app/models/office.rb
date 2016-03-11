class Office < ActiveRecord::Base
  before_destroy :check_for_associations
  belongs_to :company
  has_many :rooms
  has_many :events, through: :rooms
  validates :name, :company_id, presence: true
  validates :name, uniqueness: true
  def to_s
    name
  end

  def rooms?
  	rooms.any?
  end
  private
  def check_for_associations
    if rooms?
      errors[:base] << "cannot delete : events are still planned"
      false
    end
  end

end
