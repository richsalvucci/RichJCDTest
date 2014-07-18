class Customer < ActiveRecord::Base
  belongs_to :business
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
