class User < ApplicationRecord
  has_many :rentals
  has_many :cars, through: :rentals

  validates :name, presence: true, uniqueness: true
end
