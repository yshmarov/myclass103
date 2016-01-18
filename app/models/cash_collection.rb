class CashCollection < ActiveRecord::Base
  belongs_to :office
  belongs_to :admin
end
