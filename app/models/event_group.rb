class EventGroup < ActiveRecord::Base
  belongs_to :attr1
  belongs_to :attr2
  belongs_to :attr3
  belongs_to :service
  validates :name, :status, :attr1_id, :attr2_id, :attr3_id, :service_id, presence: true
  validates :name, uniqueness: true
  has_many :events, dependent: :destroy
  has_many :attendances, through: :events
  has_many :guests, through: :attendances
  def to_s
  	name
  end
  accepts_nested_attributes_for :events, reject_if: proc { |attributes| attributes ['user_id'].blank? }, allow_destroy: true

end
