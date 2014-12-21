# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  token       :string
#  state       :string
#  address_id  :integer
#  items_count :integer          default("0")
#  total       :decimal(, )      default("0.0")
#  balance     :decimal(, )      default("0.0")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
