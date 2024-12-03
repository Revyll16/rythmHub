# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed Users
Users.destroy_all
Musicians.destroy_all


users = [
  { email: "admin@example.com", password: "password123" },
  { email: "user1@example.com", password: "password123" },
  { email: "user2@example.com", password: "password123" }
]

users.each do |user_attributes|
  User.find_or_create_by!(email: user_attributes[:email]) do |user|
    user.password = user_attributes[:password]
  end
end

# Seed Musicians
musicians = [
  { name: "John Doe", instrument: "Guitar", bio: "A passionate guitarist from NYC." },
  { name: "Jane Smith", instrument: "Piano", bio: "A classical pianist with a modern twist." },
  { name: "Alice Johnson", instrument: "Violin", bio: "An aspiring violinist with a love for jazz." }
]

musicians.each do |musician_attributes|
  Musician.find_or_create_by!(name: musician_attributes[:name]) do |musician|
    musician.instrument = musician_attributes[:instrument]
    musician.bio = musician_attributes[:bio]
  end
end

# Seed Compositions
compositions = [
  { title: "Symphony No. 1", video_url: "https://example.com/symphony1", description: "A masterpiece of modern classical music.", musician_name: "John Doe" },
  { title: "Jazz Improv", video_url: "https://example.com/jazzimprov", description: "An exploration of jazz and improvisation.", musician_name: "Jane Smith" }
]

compositions.each do |composition_attributes|
  musician = Musician.find_by!(name: composition_attributes[:musician_name])
  Composition.find_or_create_by!(title: composition_attributes[:title]) do |composition|
    composition.video_url = composition_attributes[:video_url]
    composition.description = composition_attributes[:description]
    composition.musician = musician
  end
end

# Seed Instruments
instruments = [
  { name: "Electric Guitar", description: "A versatile instrument for rock and blues.", musician_name: "John Doe" },
  { name: "Grand Piano", description: "Perfect for classical and jazz performances.", musician_name: "Jane Smith" }
]

instruments.each do |instrument_attributes|
  musician = Musician.find_by!(name: instrument_attributes[:musician_name])
  Instrument.find_or_create_by!(name: instrument_attributes[:name]) do |instrument|
    instrument.description = instrument_attributes[:description]
    instrument.musician = musician
  end
end

# Seed Forums
forums = [
  { title: "Guitar Techniques", musician_name: "John Doe" },
  { title: "Piano Compositions", musician_name: "Jane Smith" }
]

forums.each do |forum_attributes|
  musician = Musician.find_by!(name: forum_attributes[:musician_name])
  Forum.find_or_create_by!(title: forum_attributes[:title]) do |forum|
    forum.musician = musician
  end
end

# Seed Posts
posts = [
  { content: "What's the best way to improve finger strength?", forum_title: "Guitar Techniques", musician_name: "Alice Johnson" },
  { content: "What are some good exercises for sight-reading?", forum_title: "Piano Compositions", musician_name: "Jane Smith" }
]

posts.each do |post_attributes|
  forum = Forum.find_by!(title: post_attributes[:forum_title])
  musician = Musician.find_by!(name: post_attributes[:musician_name])
  Post.find_or_create_by!(content: post_attributes[:content]) do |post|
    post.forum = forum
    post.musician = musician
  end
end

# Seed Feedbacks
feedbacks = [
  { content: "Amazing work on this composition!", composition_title: "Symphony No. 1", musician_name: "Alice Johnson" },
  { content: "This is a great jazz piece!", composition_title: "Jazz Improv", musician_name: "John Doe" }
]

feedbacks.each do |feedback_attributes|
  composition = Composition.find_by!(title: feedback_attributes[:composition_title])
  musician = Musician.find_by!(name: feedback_attributes[:musician_name])
  Feedback.find_or_create_by!(content: feedback_attributes[:content]) do |feedback|
    feedback.composition = composition
    feedback.musician = musician
  end
end
