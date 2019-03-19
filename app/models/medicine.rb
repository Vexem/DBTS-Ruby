class Medicine < ApplicationRecord
  belongs_to :medicinetousers, optional: true
  #has_many :user, through: :medicinetousers
  has_many :medicinetousers

  validates :medicine_name, presence: true, uniqueness: true
end
