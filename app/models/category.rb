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
#  image       :string
#

require "babosa"

class Category < ActiveRecord::Base
  extend FriendlyId

  mount_uploader :image, ImageUploader

  has_many :produts, inverse_of: :category, dependent: :destroy

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  friendly_id :name, use: :slugged

  def normalize_friendly_id input
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
