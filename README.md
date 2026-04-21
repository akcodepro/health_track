# 💚 HealthTrack

A personal health journaling app built with Ruby on Rails.

## Features

- Daily health entries tracking mood, energy, sleep and water intake
- Weekly average stats dashboard
- Consecutive day streak counter
- Colour-coded entries by mood
- User authentication with Devise
- Per-user data — each user only sees their own entries

## Setup

1. Clone the repo
git clone https://github.com/akcodepro/health_track.git
cd health_track

2. Install dependencies
bundle install

3. Set up the database
rails db:migrate
rails db:seed

4. Start the server
rails server

5. Visit `http://localhost:3000` and log in with:
  - Email: `demo@healthtrack.com`
  - Password: `password123`

## Built With

- Ruby on Rails 7
- Bootstrap 5
- Devise
- SQLite
