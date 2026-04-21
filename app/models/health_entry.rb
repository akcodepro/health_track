class HealthEntry < ApplicationRecord
  belongs_to :user

  validates :date, presence: true, uniqueness: { scope: :user_id, message: "already has an entry" }
  validates :mood, presence: true, numericality: { in: 1..5 }
  validates :energy, presence: true, numericality: { in: 1..5 }
  validates :sleep_hours, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }
  validates :water_litres, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.streak_for(user)
    dates = user.health_entries.order(date: :desc).pluck(:date)
    return 0 if dates.empty?

    streak = 1
    dates.each_cons(2) do |later, earlier|
      if later - earlier == 1
        streak += 1
      else
        break
      end
    end
    streak
  end
end
