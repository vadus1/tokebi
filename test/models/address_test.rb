# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  street_address :string
#  city           :string
#  state          :string
#  zip            :integer
#  phone          :integer
#  user_id        :integer
#  default        :boolean
#  country_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
