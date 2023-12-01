class Shelter < ApplicationRecord
  has_many  :dogs, class_name: "Dog", foreign_key: "shelter_id", dependent: :nullify
end
