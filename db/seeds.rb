# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# youtube:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed Users
# Seed Musicians
require "open-uri"


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



# List of musicians with associated attributes
# db/seeds.rb

musicians = [
  {
    name: "Yo-Yo Ma",
    bio: "Yo-Yo Ma is a world-renowned French-born American cellist, known for his extraordinary technique and rich tone. He is one of the most famous and influential cellists of our time.",
    image_url: "https://media.wnyc.org/i/1200/630/80/nprproxy/438581988",
    instruments: "Cello",
    address: "Paris, France"
  },
  {
    name: "Andrés Segovia",
    bio: "Andrés Segovia was a Spanish classical guitarist and one of the most important guitarists of the 20th century, renowned for his virtuosity and for expanding the guitar's repertoire.",
    image_url: "https://i.ytimg.com/vi/LDsNLvOvwmI/maxresdefault.jpg",
    instruments: "Classical Guitar",
    address: "Linares, Spain"
  },
  {
    name: "Clint Black",
    bio: "Clint Black is an American country music singer, songwriter, musician, and record producer. He is known for his contributions to the country music genre and hits like 'A Better Man'.",
    image_url: "https://avatars.yandex.net/get-music-content/2357076/942b0731.a.10225239-1/m1000x1000?webp=false",
    instruments: "Guitar",
    address: "Long Branch, New Jersey, USA"
  },
  {
    name: "Herbie Hancock",
    bio: "Herbie Hancock is an American jazz pianist, keyboardist, composer, and bandleader. He is widely considered one of the most influential musicians in the jazz genre.",
    image_url: "https://api.hub.jhu.edu/factory/sites/default/files/styles/soft_crop_1300/public/Herbie_Hancock_%28ZMF_2017%29_IMGP9601.jpeg",
    instruments: "Piano",
    address: "Chicago, Illinois, USA"
  },
  {
    name: "Vladimir Horowitz",
    bio: "Vladimir Horowitz was a Russian-American classical pianist, often regarded as one of the greatest pianists of all time.",
    image_url: "https://cdn1.ozone.ru/multimedia/1020054727.jpg",
    instruments: "Piano",
    address: "Kiev, Ukraine"
  },
  {
    name: "John Bonham",
    bio: "John Bonham was an English drummer, best known as a member of the rock band Led Zeppelin. He is widely regarded as one of the greatest drummers in the history of rock music.",
    image_url: "https://i.pinimg.com/originals/40/65/1e/40651ee9635a4ed0c1132bd315caf1f8.jpg",
    instruments: "Drums",
    address: "Birmingham, England"
  },
  {
    name: "Keith Richards",
    bio: "Keith Richards is an English musician, singer, and songwriter, best known as the guitarist for the rock band The Rolling Stones.",
    image_url: "https://i.pinimg.com/originals/22/7e/a3/227ea3f8af4c330251a5213ef5f23090.jpg",
    instruments: "Guitar",
    address: "Dartford, England"
  },
  {
    name: "Jaco Pastorius",
    bio: "Jaco Pastorius was an American jazz bassist, known for his virtuosic and innovative approach to bass guitar, which revolutionized the role of the instrument in jazz.",
    image_url: "https://samcult.ru/wp-content/uploads/2019/09/3705552-e1569080166673.jpg",
    instruments: "Bass Guitar",
    address: "Norristown, Pennsylvania, USA"
  },
  {
    name: "Paco de Lucía",
    bio: "Paco de Lucía was a Spanish flamenco guitarist, composer, and producer, widely regarded as one of the greatest guitarists in the world.",
    image_url: "https://i.pinimg.com/originals/61/7a/5f/617a5f9f821c692b0d23ab80245d7010.jpg",
    instruments: "Flamenco Guitar",
    address: "Algeciras, Spain"
  },
  {
    name: "Muddy Waters",
    bio: "Muddy Waters was an American blues guitarist, singer, and songwriter, who is often called the 'father of modern Chicago blues'.",
    image_url: "https://avatars.dzeninfra.ru/get-zen_doc/133957/pub_616d007b45dde444159b0a0a_616f07228178a932b5fa1e59/scale_1200",
    instruments: "Electric Guitar",
    address: "Rolling Fork, Mississippi, USA"
  },
  {
    name: "Billie Holiday",
    bio: "Billie Holiday was an American jazz and swing music singer, known for her deeply emotional voice and her unique phrasing.",
    image_url: "https://i.pinimg.com/736x/b8/06/7b/b8067b884b5eea49e549b00f010022d1.jpg",
    instruments: "Vocals",
    address: "Philadelphia, Pennsylvania, USA"
  },
  {
    name: "Celia Cruz",
    bio: "Celia Cruz was a Cuban singer known as the 'Queen of Salsa'. She was one of the most influential figures in Latin music during the 20th century.",
    image_url: "https://m.media-amazon.com/images/M/MV5BOTU3NmZmZDItYzUwYy00MWExLTlhY2QtZjhmNDE0ZGQ5YzhiXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg",
    instruments: "Vocals",
    address: "Havana, Cuba"
  },
  {
    name: "Charlie Parker",
    bio: "Charlie Parker was an American jazz saxophonist and composer, who was a leading figure in the development of bebop, one of the most influential jazz movements.",
    image_url: "https://www.operaphila.org/media/1952/yardbird_024.jpg",
    instruments: "Alto Saxophone",
    address: "Kansas City, Missouri, USA"
  },
  {
    name: "B.B. King",
    bio: "B.B. King was an American blues singer, electric guitarist, and songwriter. He is widely considered one of the most important and influential blues musicians of all time.",
    image_url: "https://imageio.forbes.com/specials-images/imageserve/b232c3b558f54b6792880b8026daf26c/0x0.jpg?format=jpg&amp;width=1200",
    instruments: "Electric Guitar",
    address: "Indianola, Mississippi, USA"
  },
  {
    name: "Nina Simone",
    bio: "Nina Simone was an American singer, songwriter, and pianist, known for her deep, soulful voice and her work in jazz, blues, and civil rights activism.",
    image_url: "https://nypost.com/wp-content/uploads/sites/2/2021/06/nina-simone-kamla-harris-index.jpg?quality=75&amp;strip=all&amp;w=1024",
    instruments: "Piano",
    address: "Tryon, North Carolina, USA"
  },
  {
    name: "James Brown",
    bio: "James Brown was an American singer, songwriter, and dancer, known as the 'Godfather of Soul'. He was one of the most influential figures in the history of music.",
    image_url: "https://i.ytimg.com/vi/qe0RsmxEZec/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGGUgTShDMA8=&amp;rs=AOn4CLCyWqskHGZSMeQVLkZJ0C_gQJGXQg",
    instruments: "Vocals",
    address: "Barnwell, South Carolina, USA"
  },
  {
    name: "John Doe",
    bio: "John Doe is a multi-instrumentalist known for his eclectic style that blends various genres, from classical to jazz, rock, and electronic. His musical journey began at an early age when he first picked up a guitar at the age of seven. Over the years, John honed his skills on a variety of instruments, including piano, drums, and violin.",
    image_url: "https://th.bing.com/th/id/OIP.LuE7kwG2B8SunikDvzhgVQHaE8?rs=1&pid=ImgDetMain",
    address: "123 Harmony Lane, Music City",
    instruments: ["Guitar", "Piano", "Drums", "Violin"]
  },
  {
    name: "Jane Smith",
    bio: "Jane Smith is a classically trained pianist with a passion for composition and a deep understanding of music theory. From a young age, she was recognized for her exceptional talent, earning a scholarship to one of the most prestigious music conservatories in the world. Jane’s early influences were composers like Chopin, Debussy, and Rachmaninoff, whose works she studied meticulously.",
    image_url: "https://th.bing.com/th/id/R.d35ff56255afd9012eb7319d478c6e62?rik=zWoURL%2b9N3faHA&riu=http%3a%2f%2felissagayle.ebersold.org%2fblog%2fwp-content%2fuploads%2f2019%2f04%2f190412_MoriahFormica_ElissaEbersold_ConcertPhotography-lg-12.jpg&ehk=AO%2bQf%2bXrAF58qzjbRGi6lC4WE%2bHuuYRbuUTRYzpE%2b5A%3d&risl=&pid=ImgRaw&r=0",
    address: "456 Sonata Street, Piano Town",
    instruments: ["Piano"]
  },
  {
    name: "Bob Marley",
    bio: "Bob Marley is a reggae legend, blending soul and rhythm to create some of the most iconic songs in music history. Born in Jamaica, Bob’s early life was shaped by the sounds of traditional Jamaican music, but it was the influence of R&B and soul that made his music universally loved. His breakthrough came in the 1970s with the formation of the band, The Wailers, whose mix of reggae, rock, and soul was revolutionary.",
    image_url: "https://i0.wp.com/africhroyale.com/wp-content/uploads/2020/08/bob-marley.jpg?fit=1200,1200&ssl=1",
    address: "1 Love Ave, Kingston, Jamaica",
    instruments: ["Guitar", "Vocals"]
  },
  {
    name: "Louis Armstrong",
    bio: "Louis Armstrong, one of the most iconic figures in jazz history, is renowned for his unique trumpet playing and his deep, gravelly voice. Born in New Orleans, he grew up in poverty but found solace in music, playing in local brass bands before making his way to Chicago. It was there that he became a leading figure in the birth of jazz, revolutionizing the genre with his improvisational skills and musical creativity.",
    image_url: "https://wallpapers.com/images/hd/american-musician-and-vocalist-louis-armstrong-7qe7z9c4160env44.jpg",
    address: "789 Jazz Blvd, New Orleans, LA",
    instruments: ["Trumpet", "Vocals"]
  },
  {
    name: "Tina Turner",
    bio: "Tina Turner is an iconic singer known for her powerful voice and stage presence, making her one of the most influential artists in music history. Born Anna Mae Bullock in Nutbush, Tennessee, Tina started her career as a backing vocalist before joining Ike Turner’s band. Her breakthrough came when she and Ike formed the duo 'Ike & Tina Turner,' which earned her a reputation for her electrifying performances and fierce vocals.",
    image_url: "https://th.bing.com/th/id/OIP.RC5YfZUdffs0GPYUWox7ywHaK0?rs=1&pid=ImgDetMain",
    address: "321 Rock Road, Nutbush, TN",
    instruments: ["Vocals"]
  },
  {
    name: "Elvis Presley",
    bio: "Elvis Presley, often referred to as the 'King of Rock and Roll,' revolutionized the music industry and changed the cultural landscape of the 20th century. Born in Tupelo, Mississippi, Elvis grew up in a modest household but was always surrounded by music, which influenced his love for gospel, blues, and country. His breakthrough came in 1956 with his first single 'Heartbreak Hotel,' and he soon became a cultural icon.",
    image_url: "https://media.gq-magazine.co.uk/photos/5d1396393bedf20055db67b3/master/w_1366%2cc_limit/Elvis-12-GQ-16Aug17_getty_b.jpg",
    address: "Graceland, Memphis, TN",
    instruments: ["Guitar", "Vocals"]
  },
  {
    name: "Beethoven",
    bio: "Ludwig van Beethoven, born in 1770 in Bonn, Germany, is regarded as one of the greatest composers in the history of Western music. His works revolutionized classical music, bridging the gap between the Classical and Romantic periods. Beethoven’s early music was influenced by his predecessors, such as Haydn and Mozart, but his later compositions defied traditional structures and norms.",
    image_url: "https://th.bing.com/th/id/OIP.WjKXjy86_u4WVnobHo-IYQAAAA?rs=1&pid=ImgDetMain",
    address: "12 Symphony Lane, Bonn, Germany",
    instruments: ["Piano", "Orchestra"]
  },
  {
    name: "Mozart",
    bio: "Wolfgang Amadeus Mozart, born in 1756 in Salzburg, Austria, was one of the most prolific and influential composers of the Classical era. His musical genius was apparent from a young age, and he began composing music at the age of five. Mozart composed over 600 works, including symphonies, operas, chamber music, and choral compositions, many of which are considered masterpieces.",
    image_url: "https://tmms.co.uk/wp-content/uploads/2023/01/imgpsh_fullsize_anim-5.png",
    address: "34 Sonata Square, Salzburg, Austria",
    instruments: ["Piano", "Violin", "Orchestra"]
  }
]


# Create users and assign each to a musician
musicians.each do |musician|
  # Create a user for the musician
  user = User.create!(
    email: "#{musician[:name].downcase.gsub(' ', '.')}@youtube.com",
    password: "password"
  )

  file = URI.parse(musician[:image_url]).open
  # Create the musician and associate with the user
  new_musician = Musician.new(
    name: musician[:name],
    bio: musician[:bio],

    address: musician[:address],
    user_id: user.id
  )
  new_musician.image.attach(io: file, filename: "#{user.id}.png", content_type: "image/png")
  new_musician.save!
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
  musician = Musician.all.sample
  instrument = Instrument.new(instrument)
  instrument.musician = musician
  instrument.save!

end
puts "#{Instrument.count} instruments seeded"

# Seed Compositions
compositions = [
  { title: "Beginner Piano Lesson 1", video_url: "https://www.youtube.com/watch?v=827jmswqnEA", description: "Learn the basics of playing the piano." },
  { title: "How to Play Guitar Chords (Beginner Tutorial)", video_url: "https://www.youtube.com/watch?v=d52MZJw-hIE&t=77s", description: "Master the basic chords for guitar." },
  { title: "Drum Lessons for Beginners", video_url: "https://www.youtube.com/watch?v=et9hU7QMDYU", description: "A step-by-step guide to drumming for beginners." },
  { title: "Learn to Play the Violin", video_url: "https://www.youtube.com/watch?v=6Q2IP5K29gY", description: "A crash course in violin playing." },
  { title: "Saxophone Tutorial for Beginners", video_url: "https://www.youtube.com/watch?v=ky716yPvrKE", description: "Start your journey to playing the saxophone." },
  { title: "Flute Basics for Beginners", video_url: "https://www.youtube.com/watch?v=Jn8fQ-ZmvBE", description: "Learn the basics of playing the flute." },
  { title: "How to Play Bass Guitar for Beginners", video_url: "https://www.youtube.com/watch?v=y_p4cSklyik", description: "An introduction to bass guitar techniques." },
  { title: "Cello Basics: Beginner Tutorial", video_url: "https://www.youtube.com/watch?v=MDYGUZTu2x0", description: "Get started with cello playing." },
  { title: "Ukulele for Absolute Beginners", video_url: "https://www.youtube.com/watch?v=5bTE5fbxDsc", description: "Learn to play the ukulele in this beginner tutorial." },
  { title: "How to Play Trumpet (Beginner Tutorial)", video_url: "https://www.youtube.com/watch?v=FFJ4FGlW5Zo", description: "A simple guide to playing the trumpet." },
  { title: "Learn the Basics of Harmonica", video_url: "https://www.youtube.com/watch?v=cDV_qckR0tc", description: "Step-by-step harmonica tutorial for beginners." },
  { title: "Clarinet Beginner Tutorial", video_url: "https://www.youtube.com/watch?v=Izf5sGMI1CY&list=PL06seol1EtFdQcYRN7tXnep5shRKg8drH", description: "Learn to play the clarinet from scratch." },
  { title: "Percussion Instruments Basics", video_url: "https://www.youtube.com/watch?v=5AdDacff0Nw", description: "An introduction to various percussion instruments." },
  { title: "Banjo Basics for Beginners", video_url: "https://www.youtube.com/watch?v=fn4YhHdhhUU", description: "Start learning the banjo with this beginner tutorial." },
  { title: "How to Play Mandolin for Beginners", video_url: "https://www.youtube.com/watch?v=DvDDGN1h36s", description: "A simple guide to playing the mandolin." },
  { title: "Trombone Beginner Tutorial", video_url: "https://www.youtube.com/watch?v=Ymt3UbVPBm4", description: "Learn the fundamentals of trombone playing." },
  { title: "Learn to Play the Oboe", video_url: "https://www.youtube.com/watch?v=uCTo04Q_MvE", description: "Beginner's guide to playing the oboe." },
  { title: "Accordion Tutorial for Beginners", video_url: "https://www.youtube.com/watch?v=cvssDTDDgOU", description: "Learn to play the accordion with this beginner video." },
  { title: "Djembe Drumming Basics", video_url: "https://www.youtube.com/watch?v=n65_ZOh7jag", description: "Start drumming with this djembe tutorial." },
  { title: "Beginner Lessons on Recorder", video_url: "https://www.youtube.com/watch?v=9KZbADc2I8g", description: "Learn to play the recorder in simple steps." }
]



# Associate compositions with musicians
musicians = Musician.all

compositions.each_with_index do |comp, index|
  musicians[index].compositions.create!(comp)
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
