class Enrollment < ActiveRecord::Base

  belongs_to :event_group
  belongs_to :guest
  belongs_to :user
  belongs_to :coupon
  belongs_to :opp_status
  has_many :payments
  validates :event_group_id, :guest_id, :user_id, presence: true

  def to_s
  	id
  end
end
