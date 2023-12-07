# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string
#  role            :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  ADMIN_ROLE = 'admin'
  GUEST_ROLE = 'guest'
  # Define each shelter role
  SHELTER1_ROLE = 'Rescue4Ever'
  SHELTER2_ROLE = 'Tails2You'
  SHELTER3_ROLE = 'Windy City Animal Shelter'
  SHELTER4_ROLE = 'Gotham Pet Rescue'
  SHELTER5_ROLE = 'Paws To the Rescue'
end
