# == Schema Information
#
# Table name: shelters
#
#  id          :integer          not null, primary key
#  city        :string
#  description :string
#  dogs_count  :integer
#  image       :string
#  name        :string
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  dog_id      :integer
#
class Shelter < ApplicationRecord
  has_many  :dogs, class_name: "Dog", foreign_key: "shelter_id", dependent: :nullify
end
