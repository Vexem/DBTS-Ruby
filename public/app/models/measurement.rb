class Measurement < ApplicationRecord
  self.primary_keys = :name, :created_at
  belongs_to :user, optional: true
end
