class HealthEntry < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :mood, presence: true, numericality: { in: 1..5 }
  validates :energy, presence: true, numericality: { in: 1..5 }
  validates :sleep_hours, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
  validates :water_litres, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
