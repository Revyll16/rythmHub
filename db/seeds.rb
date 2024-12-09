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
# db/seeds.rb

musicians = [
  {
    name: "Yo-Yo Ma",
    bio: "Yo-Yo Ma is a world-renowned French-born American cellist, known for his extraordinary technique and rich tone. He is one of the most famous and influential cellists of our time.",
    image_url: "https://media.wnyc.org/i/1200/630/80/nprproxy/438581988",
    instrument_name: "Cello",
    address: "Paris, France"
  },
  {
    name: "Andrés Segovia",
    bio: "Andrés Segovia was a Spanish classical guitarist and one of the most important guitarists of the 20th century, renowned for his virtuosity and for expanding the guitar's repertoire.",
    image_url: "https://i.ytimg.com/vi/LDsNLvOvwmI/maxresdefault.jpg",
    instrument_name: "Classical Guitar",
    address: "Linares, Spain"
  },
  {
    name: "Clint Black",
    bio: "Clint Black is an American country music singer, songwriter, musician, and record producer. He is known for his contributions to the country music genre and hits like 'A Better Man'.",
    image_url: "https://avatars.yandex.net/get-music-content/2357076/942b0731.a.10225239-1/m1000x1000?webp=false",
    instrument_name: "Guitar",
    address: "Long Branch, New Jersey, USA"
  },
  {
    name: "Herbie Hancock",
    bio: "Herbie Hancock is an American jazz pianist, keyboardist, composer, and bandleader. He is widely considered one of the most influential musicians in the jazz genre.",
    image_url: "https://api.hub.jhu.edu/factory/sites/default/files/styles/soft_crop_1300/public/Herbie_Hancock_%28ZMF_2017%29_IMGP9601.jpeg",
    instrument_name: "Piano",
    address: "Chicago, Illinois, USA"
  },
  {
    name: "Vladimir Horowitz",
    bio: "Vladimir Horowitz was a Russian-American classical pianist, often regarded as one of the greatest pianists of all time.",
    image_url: "https://cdn1.ozone.ru/multimedia/1020054727.jpg",
    instrument_name: "Piano",
    address: "Kiev, Ukraine"
  },
  {
    name: "John Bonham",
    bio: "John Bonham was an English drummer, best known as a member of the rock band Led Zeppelin. He is widely regarded as one of the greatest drummers in the history of rock music.",
    image_url: "https://i.pinimg.com/originals/40/65/1e/40651ee9635a4ed0c1132bd315caf1f8.jpg",
    instrument_name: "Drums",
    address: "Birmingham, England"
  },
  {
    name: "Keith Richards",
    bio: "Keith Richards is an English musician, singer, and songwriter, best known as the guitarist for the rock band The Rolling Stones.",
    image_url: "https://i.pinimg.com/originals/22/7e/a3/227ea3f8af4c330251a5213ef5f23090.jpg",
    instrument_name: "Guitar",
    address: "Dartford, England"
  },
  {
    name: "Jaco Pastorius",
    bio: "Jaco Pastorius was an American jazz bassist, known for his virtuosic and innovative approach to bass guitar, which revolutionized the role of the instrument in jazz.",
    image_url: "https://samcult.ru/wp-content/uploads/2019/09/3705552-e1569080166673.jpg",
    instrument_name: "Bass Guitar",
    address: "Norristown, Pennsylvania, USA"
  },
  {
    name: "Paco de Lucía",
    bio: "Paco de Lucía was a Spanish flamenco guitarist, composer, and producer, widely regarded as one of the greatest guitarists in the world.",
    image_url: "https://i.pinimg.com/originals/61/7a/5f/617a5f9f821c692b0d23ab80245d7010.jpg",
    instrument_name: "Flamenco Guitar",
    address: "Algeciras, Spain"
  },
  {
    name: "Muddy Waters",
    bio: "Muddy Waters was an American blues guitarist, singer, and songwriter, who is often called the 'father of modern Chicago blues'.",
    image_url: "https://avatars.dzeninfra.ru/get-zen_doc/133957/pub_616d007b45dde444159b0a0a_616f07228178a932b5fa1e59/scale_1200",
    instrument_name: "Electric Guitar",
    address: "Rolling Fork, Mississippi, USA"
  },
  {
    name: "Tina Turner",
    bio: "Tina Turner is an American-born Swiss singer, songwriter, and actress. She is widely known for her powerful vocals and energetic performances.",
    image_url: "https://www.whartoncenter.com/assets/img/tina-photo-1-6c09baeb5f.jpg",
    instrument_name: "Vocals",
    address: "Nutbush, Tennessee, USA"
  },
  {
    name: "Louis Armstrong",
    bio: "Louis Armstrong was an American jazz trumpeter, composer, and vocalist, who was one of the most influential figures in the development of jazz music.",
    image_url: "https://cdn.ananasposter.ru/image/cache/catalog/poster/pos23/25/69219-1000x830.jpg",
    instrument_name: "Trumpet",
    address: "New Orleans, Louisiana, USA"
  },
  {
    name: "Billie Holiday",
    bio: "Billie Holiday was an American jazz and swing music singer, known for her deeply emotional voice and her unique phrasing.",
    image_url: "https://i.pinimg.com/736x/b8/06/7b/b8067b884b5eea49e549b00f010022d1.jpg",
    instrument_name: "Vocals",
    address: "Philadelphia, Pennsylvania, USA"
  },
  {
    name: "Celia Cruz",
    bio: "Celia Cruz was a Cuban singer known as the 'Queen of Salsa'. She was one of the most influential figures in Latin music during the 20th century.",
    image_url: "https://m.media-amazon.com/images/M/MV5BOTU3NmZmZDItYzUwYy00MWExLTlhY2QtZjhmNDE0ZGQ5YzhiXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
    instrument_name: "Vocals",
    address: "Havana, Cuba"
  },
  {
    name: "Charlie Parker",
    bio: "Charlie Parker was an American jazz saxophonist and composer, who was a leading figure in the development of bebop, one of the most influential jazz movements.",
    image_url: "https://www.operaphila.org/media/1952/yardbird_024.jpg",
    instrument_name: "Alto Saxophone",
    address: "Kansas City, Missouri, USA"
  },
  {
    name: "B.B. King",
    bio: "B.B. King was an American blues singer, electric guitarist, and songwriter. He is widely considered one of the most important and influential blues musicians of all time.",
    image_url: "https://imageio.forbes.com/specials-images/imageserve/b232c3b558f54b6792880b8026daf26c/0x0.jpg?format=jpg&amp;width=1200",
    instrument_name: "Electric Guitar",
    address: "Indianola, Mississippi, USA"
  },
  {
    name: "Nina Simone",
    bio: "Nina Simone was an American singer, songwriter, and pianist, known for her deep, soulful voice and her work in jazz, blues, and civil rights activism.",
    image_url: "https://nypost.com/wp-content/uploads/sites/2/2021/06/nina-simone-kamla-harris-index.jpg?quality=75&amp;strip=all&amp;w=1024",
    instrument_name: "Piano",
    address: "Tryon, North Carolina, USA"
  },
  {
    name: "James Brown",
    bio: "James Brown was an American singer, songwriter, and dancer, known as the 'Godfather of Soul'. He was one of the most influential figures in the history of music.",
    image_url: "https://i.ytimg.com/vi/qe0RsmxEZec/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGGUgTShDMA8=&amp;rs=AOn4CLCyWqskHGZSMeQVLkZJ0C_gQJGXQg",
    instrument_name: "Vocals",
    address: "Barnwell, South Carolina, USA"
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
  { title: "Imagine", video_url: "https://example.com/symphony_5", description: "A classic song by John Lennon." },
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
  {
    title: "Jazz Lovers Forum",
    musician_id: Musician.all.sample.id,
    image_url: "https://th.bing.com/th/id/OIP.G-vodZ4jq2obkuHUbi5_EgHaHa?rs=1&pid=ImgDetMain"
  },
  {
    title: "Rock and Roll Discussion",
    musician_id: Musician.all.sample.id,
    image_url: "https://th.bing.com/th/id/OIP.GmTHUTn9Z27FDWe57SRqCwHaE8?rs=1&pid=ImgDetMain"
  },
  {
    title: "Classical Music Enthusiasts",
    musician_id: Musician.all.sample.id,
    image_url: "https://w0.peakpx.com/wallpaper/261/459/HD-wallpaper-violin-music-concepts-creative-3d-art-sheet-music-abstract-art-musical-instruments.jpg"
  },
  {
    title: "Reggae Fans Forum",
    musician_id: Musician.all.sample.id,
    image_url: "https://th.bing.com/th/id/OIP.3pEW3RRA45KN2QZutxjidwHaHa?rs=1&pid=ImgDetMain"
  },
  {
    title: "Piano Players Hub",
    musician_id: Musician.all.sample.id,
    image_url: "https://png.pngtree.com/thumb_back/fh260/background/20230717/pngtree-3d-rendered-piano-keys-image_3897413.jpg"
  },
  {
    title: "String Instruments Group",
    musician_id: Musician.all.sample.id,
    image_url: "https://th.bing.com/th/id/R.54b89db050cd2a9840e4ca776124a3e7?rik=s63qGrFtxEEhBw&pid=ImgRaw&r=0"
  },
  {
    title: "Music Composition Forum",
    musician_id: Musician.all.sample.id,
    image_url: "https://th.bing.com/th/id/OIP.ibc4VQldQOONUo1ake1B1gHaEK?rs=1&pid=ImgDetMain"
  },
  {
    title: "Live Music Lovers",
    musician_id: Musician.all.sample.id,
    image_url: ""
  }
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
