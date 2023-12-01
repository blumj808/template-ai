# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  age        :string
#  bio        :string
#  dogs_count :integer
#  gender     :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pet_id     :integer
#
class Owner < ApplicationRecord
  has_many  :dogs, class_name: "Dog", foreign_key: "owner_id", dependent: :nullify
end
