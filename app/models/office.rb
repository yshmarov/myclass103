class Office < ActiveRecord::Base
  belongs_to :company
  has_many :rooms, dependent: :destroy
  def to_s
    name
  end
end
