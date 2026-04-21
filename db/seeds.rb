# Clear existing data
HealthEntry.destroy_all
User.destroy_all

# Create a demo user
user = User.create!(
  email: "demo@healthtrack.com",
  password: "password123",
  password_confirmation: "password123"
)

# Create 30 days of entries
30.times do |i|
  HealthEntry.create!(
    user: user,
    date: Date.today - i.days,
    mood: rand(1..5),
    energy: rand(1..5),
    sleep_hours: rand(5.0..9.0).round(1),
    water_litres: rand(1.0..3.0).round(1),
    notes: ["Feeling good today", "Tough day", "Great workout", "Tired but productive", ""].sample
  )
end

puts "Created demo user: demo@healthtrack.com / password123"
puts "Created #{HealthEntry.count} health entries"
