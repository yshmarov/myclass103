class Expence < ActiveRecord::Base
  belongs_to :user
  validates :amount, :user_id, presence: true
end
