class ReplenishmentHistory < ApplicationRecord
  belongs_to :product
  validates :quantity, numericality: { greater_than: 0 }
  validates :purchase_price, numericality: { greater_than: 0 }
end
