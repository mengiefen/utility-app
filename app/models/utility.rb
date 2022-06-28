class Utility < ApplicationRecord
  belongs_to :user
  has_many :utility_payments
  has_many :payments, through: :utility_payments

  has_one_attached :icon
  validates :name, presence: true
end
