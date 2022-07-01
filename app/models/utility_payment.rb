class UtilityPayment < ApplicationRecord
  belongs_to :utility
  belongs_to :payment
end
