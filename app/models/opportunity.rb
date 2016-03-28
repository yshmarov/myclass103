class Opportunity < ActiveRecord::Base
  belongs_to :service
  belongs_to :event_group
  belongs_to :user
  belongs_to :guest
  belongs_to :coupon
  belongs_to :opp_status
  def to_s
  	id
  end
end
