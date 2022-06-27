class Payment < ApplicationRecord
  belongs_to :user
  has_many :utility_payments
  has_many :utilities, through: :utility_payments
end