# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  age        :integer
#  bio        :string
#  breed      :string
#  gender     :string
#  name       :string
#  picture    :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  shelter_id :integer
#
class Dog < ApplicationRecord
  belongs_to :shelter, class_name: "Shelter", foreign_key: "shelter_id", counter_cache: true, optional: true
  belongs_to :owner, class_name: "Owner", foreign_key: "owner_id", counter_cache: true, optional: true
end
