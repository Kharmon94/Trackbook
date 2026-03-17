# This file should contain all the record creation needed to seed the database with its default values.
# Run with `bin/rails db:seed` or during `db:setup`.

# wipe existing sample data so the seed is idempotent
Track.destroy_all
Project.destroy_all
User.destroy_all

puts "Creating users..."
u1 = User.create!(email: "alice@example.com", password: "password", password_confirmation: "password")
u2 = User.create!(email: "bob@example.com", password: "password", password_confirmation: "password", admin: true)

puts "Creating projects..."
p1 = u1.projects.create!(name: "Road to Album")
p2 = u1.projects.create!(name: "Side Projects")
p3 = u2.projects.create!(name: "Admin's Collection")

puts "Creating tracks..."
p1.tracks.create!(title: "Intro", track_number: 1, main_artist: "Alice")
p1.tracks.create!(title: "Deep Cut", track_number: 2, main_artist: "Alice", featured_artists: "Bob")
p2.tracks.create!(title: "Experiment", track_number: 1, main_artist: "Alice")
p3.tracks.create!(title: "Admin Track", track_number: 1, main_artist: "Bob")

puts "Seed complete."

