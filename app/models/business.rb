class Business < ActiveRecord::Base
  has_many :customers
  validates :name, presence: true
  validates :phone_number, presence: true
end
