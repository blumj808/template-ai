class Owner < ApplicationRecord
  has_many  :dogs, class_name: "Dog", foreign_key: "owner_id", dependent: :nullify
end
