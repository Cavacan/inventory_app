class Product < ApplicationRecord
  has_one :stock

  validates :code, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: :version, message: 'Same version and same name cannot be used' } 

  after_initialize :set_default_active, if: :new_record?
  after_create :initialize_stock

  scope :active, -> { where(active: true) }
  scope :active_and_sorted, -> {
    where("end_date IS NILL OR end_date >= ?", Date.current)
      .order(
        Arel.sql("COALESCE(end_date, '2999-12-31') ASC, COALESCE(start_date, '1900-01-01') ASC" )
      )
  }


  private

  def set_default_active
    self.active = true if active.nil?
  end

  def initialize_stock
    create_stock(quantity: 0, purchase_price: 0, supplier: "")
  end
end
