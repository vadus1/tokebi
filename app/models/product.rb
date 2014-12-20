# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  price       :decimal(8, 2)    not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :category, inverse_of: :products

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true, numericality: {greater_than: 0}
end
