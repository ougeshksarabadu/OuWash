class Car < ApplicationRecord
  belongs_to :user_id
  validates :brand, presence: true
  validates :type, presence:  true, inclusion: { in: %w(SUV sedan truck luxury) }
  validates :year, presence: true, length: { minimum: 4, maximum: 5 }
end
