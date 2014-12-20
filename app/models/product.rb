class Product < ActiveRecord::Base
  belongs_to :category, inverse_of: :products

  validate :name,        presence: true
  validate :description, presence: true
  validate :price,       presence: true, numericality: {greater_than: 0}
end
