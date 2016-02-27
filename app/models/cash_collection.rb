class CashCollection < ActiveRecord::Base
  belongs_to :office
  belongs_to :admin
  validates :amount, :admin_id, :office_id, presence: true
end
