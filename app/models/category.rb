# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string           not null
#

class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :produts, inverse_of: :category, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  friendly_id :name, use: :slugged
end
