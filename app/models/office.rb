class Office < ActiveRecord::Base
  belongs_to :company
  has_many :rooms
  has_many :events, through: :rooms
  validates :name, :company_id, presence: true
  validates :name, uniqueness: true
  def to_s
    name
  end
end
