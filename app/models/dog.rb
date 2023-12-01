class Dog < ApplicationRecord
  belongs_to :shelter, class_name: "Shelter", foreign_key: "shelter_id", counter_cache: true
  belongs_to :owner, class_name: "Owner", foreign_key: "owner_id", counter_cache: true
end
