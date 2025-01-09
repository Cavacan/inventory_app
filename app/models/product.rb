class Product < ApplicationRecord
  validates :code, presence: true
  validates :name, presence: true
  validates :name, uniquness: { scope: :version, message: 'Same version and same name cannot be used'} 

  has_many :stocks
end
