# == Schema Information
#
# Table name: countries
#
#  id               :integer          not null, primary key
#  name             :string
#  shipping_rate_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Country < ActiveRecord::Base
  has_many :cities
  belongs_to :shipping_rate

  delegate :rate, to: :shipping_rate
end
