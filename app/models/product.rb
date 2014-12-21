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
  has_many   :items
  has_many   :orders, through: :items

  scope :last_four_products, -> { order('created_at DESC').limit(4) }
  scope :available,          -> { where("quantity != ?", 0) }

  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true, numericality: {greater_than: 0}
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  #include PgSearch
  #pg_search_scope :search, against: [:name, :description],
  #                using: {tsearch: {dictionary: "english"}}

  def self.text_search query
    query.present? ? search(query) : scoped
  end

  def self.by_category category_id
    category_id.present? ? joins(:category).where(categories: { slug: category_id }) : scoped
  end

  def self.by_price_range min, max
    (min.present? and max.present?) ? where("price >= ? and price <= ?", min, max) : scoped
  end

  def self.sort_by type
    case type.to_i
      when 1 then order('products.name ASC')
      when 2 then order('products.name DESC')
      when 3 then order('products.price ASC')
      when 4 then order('products.price DESC')
      else scoped
    end
  end
end
