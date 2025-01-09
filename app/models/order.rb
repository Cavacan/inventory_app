class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0}
  validate :validate_stock_quantity

  after_create :update_stock_quantity
  after_create :send_order_email

  private

  def validate_stock_quantity
    if quantity > product.stock.quantity
      errors.add(:quantity, 'Order quantity exceeds stock quantity')
    end
  end

  def update_stock_quantity
    product.stock.update!(quantity: product.stock.quantity - quantity)
  end

  def send_order_email
    UserMailer.ordr_confirmation(self).deliver_later
  end
end
