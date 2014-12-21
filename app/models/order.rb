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

class Order < ActiveRecord::Base
  include StatefulConcern

  belongs_to :address
  has_many   :items, -> { order "created_at asc" }
  has_many   :products, through: :items

  attr_accessor :guest_email

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :items

  scope :only_completed, -> { where("state != ?", 'cart') }
  scope :only_cart,      -> { with_state(:cart) }
  scope :only_shipping,  -> { with_state(:shipped) }
  scope :only_cancel,    -> { with_state(:canceled) }

  delegate :email, to: :address

  alias_method :order_email, :email

  def get_balance
    total + ((!address || address.new_record?) ? 0 : address.rate).to_f
  end

  def self.cart_by token
    Order.where(token: token, state: 'cart').includes(items: [:product]).first
  end

  def calculate_items
    self.items_count = items.sum("quantity")
    self.total = items.sum("sub_total")
    self.save
  end

  def calculate_balance
    self.balance = get_balance
    self.save
  end
end
