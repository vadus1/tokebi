# == Schema Information
#
# Table name: shipping_rates
#
#  id         :integer          not null, primary key
#  name       :string
#  rate       :decimal(, )      default("0.0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShippingRate < ActiveRecord::Base
  has_many :countries
end
