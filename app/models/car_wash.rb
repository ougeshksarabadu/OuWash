class CarWash < ApplicationRecord
  belongs_to :user
  has_many :appointments
  validates :name, :price_sedan, :price_suv, :price_truck, :price_luxury, presence: true
end
