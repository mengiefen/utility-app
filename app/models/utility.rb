class Utility < ApplicationRecord
  belongs_to :user
  has_many :utility_payments
  has_many :payments, through: :utility_payments
end
