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

class Guest < User
  def move_to user
    addresses.update_all(user_id: user.id) #move to user exists
    self.destroy
  end

  def set_default_to address
    addresses.where("id != ?", address.id).default.update_all(default: false)
    address.update_attributes(default: true)
  end

  def to_member
    self.name = name_from_email
    self.type = "Member"
  end
end
