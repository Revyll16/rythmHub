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
# Seed Musicians

puts "clearing the database"

Post.destroy_all
Forum.destroy_all
Instrument.destroy_all
Feedback.destroy_all
Composition.destroy_all
Musician.destroy_all
User.destroy_all
# db/seeds.rb

# Clear the database to avoid duplicates
User.destroy_all
Musician.destroy_all

# List of musicians with associated attributes
musicians = [
  {
    name: "John Doe",
    bio: "John Doe is a multi-instrumentalist known for his eclectic style...",
    image_url: "https://th.bing.com/th/id/OIP.LuE7kwG2B8SunikDvzhgVQHaE8?rs=1&pid=ImgDetMain",
    address: "123 Harmony Lane, Music City"
  },
  {
    name: "Jane Smith",
    bio: "Jane Smith is a classically trained pianist with a passion for composition...",
    image_url: "https://th.bing.com/th/id/R.d35ff56255afd9012eb7319d478c6e62?rik=zWoURL%2b9N3faHA&riu=http%3a%2f%2felissagayle.ebersold.org%2fblog%2fwp-content%2fuploads%2f2019%2f04%2f190412_MoriahFormica_ElissaEbersold_ConcertPhotography-lg-12.jpg&ehk=AO%2bQf%2bXrAF58qzjbRGi6lC4WE%2bHuuYRbuUTRYzpE%2b5A%3d&risl=&pid=ImgRaw&r=0",
    address: "456 Sonata Street, Piano Town"
  },
  {
    name: "Bob Marley",
    bio: "Bob Marley is a reggae legend, blending soul and rhythm to create iconic songs...",
    image_url: "https://i0.wp.com/africhroyale.com/wp-content/uploads/2020/08/bob-marley.jpg?fit=1200,1200&ssl=1",
    address: "1 Love Ave, Kingston, Jamaica"
  },
  {
    name: "Louis Armstrong",
    bio: "Louis Armstrong, one of the most iconic figures in jazz history...",
    image_url: "https://wallpapers.com/images/hd/american-musician-and-vocalist-louis-armstrong-7qe7z9c4160env44.jpg",
    address: "789 Jazz Blvd, New Orleans, LA"
  },
  {
    name: "Tina Turner",
    bio: "Tina Turner is an iconic singer known for her powerful voice...",
    image_url: "https://th.bing.com/th/id/OIP.1QwP9QoJ1l2I5UfWTY_tcQAAAA?rs=1&pid=ImgDetMain",
    address: "321 Rock Road, Nutbush, TN"
  },
  {
    name: "Elvis Presley",
    bio: "Elvis Presley, often referred to as the 'King of Rock and Roll'...",
    image_url: "https://media.gq-magazine.co.uk/photos/5d1396393bedf20055db67b3/master/w_1366%2cc_limit/Elvis-12-GQ-16Aug17_getty_b.jpg",
    address: "Graceland, Memphis, TN"
  },
  {
    name: "Beethoven",
    bio: "Ludwig van Beethoven, born in 1770 in Bonn, Germany...",
    image_url: "https://th.bing.com/th/id/OIP.WjKXjy86_u4WVnobHo-IYQAAAA?rs=1&pid=ImgDetMain",
    address: "12 Symphony Lane, Bonn, Germany"
  },
  {
    name: "Mozart",
    bio: "Wolfgang Amadeus Mozart, born in 1756 in Salzburg, Austria...",
    image_url: "https://tmms.co.uk/wp-content/uploads/2023/01/imgpsh_fullsize_anim-5.png",
    address: "34 Sonata Square, Salzburg, Austria"
  }
]

# Create users and assign each to a musician
musicians.each do |musician|
  # Create a user for the musician
  user = User.create!(
    email: "#{musician[:name].downcase.gsub(' ', '.')}@example.com",
    password: "password123"
  )

  # Create the musician and associate with the user
  Musician.create!(
    name: musician[:name],
    bio: musician[:bio],
    image_url: musician[:image_url],
    address: musician[:address],
    user_id: user.id
  )
end

puts "Created #{User.count} users and #{Musician.count} musicians."


# Seed Instruments
instruments = [
  { name: "Piano", description: "A large musical instrument with black and white keys." },
  { name: "Guitar", description: "A string instrument played by plucking or strumming." },
  { name: "Drums", description: "A percussion instrument played by striking with sticks or hands." },
  { name: "Trumpet", description: "A brass instrument with a flared bell, played by blowing into a mouthpiece." },
  { name: "Violin", description: "A string instrument played with a bow." },
  { name: "Flute", description: "A woodwind instrument played by blowing air across a hole." },
  { name: "Saxophone", description: "A brass wind instrument with a single-reed mouthpiece." },
  { name: "Bass Guitar", description: "A stringed instrument typically played in rock and jazz bands." }
]

# Associate instruments with musicians
instruments.each_with_index do |instrument, index|
  Musician.all.sample.instruments.create!(instrument)
end
puts "#{Instrument.count} instruments seeded"

# Seed Compositions
compositions = [
  { title: "Symphony No. 5", video_url: "https://example.com/symphony_5", description: "A famous symphony by Beethoven." },
  { title: "Imagine", video_url: "https://example.com/imagine", description: "A classic song by John Lennon." },
  { title: "No Woman, No Cry", video_url: "https://example.com/no_woman_no_cry", description: "A reggae anthem by Bob Marley." },
  { title: "What’s Love Got to Do with It", video_url: "https://example.com/whats_love", description: "A hit song by Tina Turner." },
  { title: "Jailhouse Rock", video_url: "https://example.com/jailhouse_rock", description: "A rock song by Elvis Presley." },
  { title: "Clair de Lune", video_url: "https://example.com/clair_de_lune", description: "A beautiful piano piece by Claude Debussy." },
  { title: "Eine kleine Nachtmusik", video_url: "https://example.com/eine_kleine", description: "A popular serenade by Mozart." },
  { title: "What a Wonderful World", video_url: "https://example.com/wonderful_world", description: "A soulful song by Louis Armstrong." }
]

# Associate compositions with musicians
compositions.each_with_index do |composition, index|
  Musician.all.sample.compositions.create!(composition)
end
puts "#{Composition.count} compositions seeded"

# Seed Forums
forums = [
  { title: "Jazz Lovers Forum", musician_id: Musician.all.sample.id },
  { title: "Rock and Roll Discussion", musician_id: Musician.all.sample.id },
  { title: "Classical Music Enthusiasts", musician_id: Musician.all.sample.id },
  { title: "Reggae Fans Forum", musician_id: Musician.all.sample.id },
  { title: "Piano Players Hub", musician_id: Musician.all.sample.id },
  { title: "String Instruments Group", musician_id: Musician.all.sample.id },
  { title: "Music Composition Forum", musician_id: Musician.all.sample.id },
  { title: "Live Music Lovers", musician_id: Musician.all.sample.id }
]


forums.each do |forum|
  Forum.create!(forum)
end
puts "#{Forum.count} forums seeded"

# Seed Posts
posts = [
  { content: "I love the improvisation in jazz!", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id },
  { content: "Rock and roll forever!", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id },
  { content: "Classical music is timeless!", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id },
  { content: "Bob Marley is a true legend.", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id  },
  { content: "The piano is such an expressive instrument.", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id  },
  { content: "I prefer acoustic guitars over electric ones.", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id  },
  { content: "Composing music is both challenging and rewarding.", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id  },
  { content: "Nothing beats a live concert experience!", forum_id: Forum.all.sample.id, musician_id: Musician.all.sample.id  }
]

posts.each do |post|
  Post.create!(post)
end
puts "#{Post.count} posts seeded"
# Seed Feedbacks
feedbacks = [
  { content: "Great melody!", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id  },
  { content: "Beautiful song, very emotional.", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id  },
  { content: "Reggae music always brings joy.", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id },
  { content: "Tina's voice is incredible!", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id },
  { content: "Elvis is still the king of rock!", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id  },
  { content: "I love the harmony in this piece.", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id  },
  { content: "Such a lively and upbeat composition!", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id  },
  { content: "Louis Armstrong’s music has so much soul.", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id }
]

feedbacks.each do |feedback|
  Feedback.create!(feedback)
end
puts "#{Feedback.count} feedbacks seeded"

puts "------------------------------------------------------------------"

puts "Database seeded successfully!"
