class Company < ActiveRecord::Base
  validates :name, :address, :email, :phone, :website, presence: true
  has_many :offices, dependent: :destroy
  validates :name, uniqueness: true
  def to_s
    name
  end
end
