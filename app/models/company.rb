class Company < ActiveRecord::Base
  has_many :offices, dependent: :destroy
  def to_s
    name
  end
end
