class Appointment < ApplicationRecord
  belongs_to :car_wash
  belongs_to :car
end
