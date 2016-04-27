class Payment < ActiveRecord::Base
  belongs_to :enrollment
  belongs_to :office

  validates :enrollment_id, :office_id, presence: true #:user_id
  validates :amount, :presence => true,
            :numericality => true,
            :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/ }
end
