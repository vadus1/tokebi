# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  biography              :text
#  avatar                 :string
#  type                   :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #mount_uploader :avatar, ImageUploader

  has_many :addresses
  has_many :orders,  through: :addresses

  def guest?
    type.eql?("Guest")
  end

  def member?
    type.eql?("Member")
  end

  def to_s
    name || email
  end

  def name_from_email
    email.split('@')[0].gsub(/[._-]/, " ").humanize
  end

  def default_address
    address ||= addresses.default.first
  end
end
