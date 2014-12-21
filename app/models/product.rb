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
#  image       :string
#  quantity    :integer          not null
#

class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :category, inverse_of: :products

  scope :last_four_products, -> { order('created_at DESC').limit(4) }

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true, numericality: {greater_than: 0}
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
