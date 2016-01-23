class EventGroup < ActiveRecord::Base
  belongs_to :attr1
  belongs_to :attr2
  belongs_to :attr3
  has_many :events, dependent: :destroy
  has_many :attendances, through: :events
  def to_s
  	name
  end
  accepts_nested_attributes_for :events, reject_if: proc { |attributes| attributes ['user_id'].blank? }, allow_destroy: true

end
