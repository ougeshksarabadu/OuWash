class CarWash < ApplicationRecord
  belongs_to :user
  validates :name, :price_sedan, :price_suv, :price_truck, :price_luxury, presence: true
end
