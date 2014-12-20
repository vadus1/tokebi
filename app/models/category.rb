class Category < ActiveRecord::Base
  has_many :produts, inverse_of: :category, dependent: :destroy
  validate :name, presence: true
end
