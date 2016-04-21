class EventGroup < ActiveRecord::Base
  belongs_to :attr1
  belongs_to :attr2
  belongs_to :attr3
  belongs_to :service

  has_many :sales
  has_many :guests, through: :sales

  #other
  has_many :events, dependent: :destroy
  has_many :users, through: :events
  has_many :attendances, through: :events
  #has_many :guests, through: :attendances
  #has_many :attendances, through: :guests

  validates :name, :status, :attr1_id, :attr2_id, :attr3_id, :service_id, presence: true
  validates :name, uniqueness: true

  def to_s
  	name
  end

  accepts_nested_attributes_for :events, reject_if: proc { |attributes| attributes ['room_id'].blank? }, allow_destroy: true

end
