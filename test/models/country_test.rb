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

require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
