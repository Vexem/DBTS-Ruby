class Medic < ApplicationRecord
  has_many :users
  validates :medic_name, presence: true, uniqueness: true
end
