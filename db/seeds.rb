require "open-uri"

puts "clearing the database"
Post.destroy_all
Forum.destroy_all
Instrument.destroy_all
Feedback.destroy_all
CompositionInstrument.destroy_all if defined?(CompositionInstrument)
Composition.destroy_all
Musician.destroy_all
User.destroy_all

# List of musicians with associated attributes
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
    bio: "Charlie Parker was an American jazz saxophonist and composer, who was a leading figure in the development of bebop.",
    image_url: "https://www.operaphila.org/media/1952/yardbird_024.jpg",
    instruments: "Alto Saxophone",
    address: "Kansas City, Missouri, USA"
  },
  {
    name: "B.B. King",
    bio: "B.B. King was an American blues singer, electric guitarist, and songwriter, considered one of the most important blues musicians.",
    image_url: "https://imageio.forbes.com/specials-images/imageserve/b232c3b558f54b6792880b8026daf26c/0x0.jpg?format=jpg&width=1200",
    instruments: "Electric Guitar",
    address: "Indianola, Mississippi, USA"
  },
  {
    name: "Nina Simone",
    bio: "Nina Simone was an American singer, songwriter, and pianist, known for her deep voice and influence in jazz and blues.",
    image_url: "https://nypost.com/wp-content/uploads/sites/2/2021/06/nina-simone-kamla-harris-index.jpg?quality=75&strip=all&w=1024",
    instruments: "Piano",
    address: "Tryon, North Carolina, USA"
  },
  {
    name: "James Brown",
    bio: "James Brown was an American singer and songwriter, known as the 'Godfather of Soul'.",
    image_url: "https://i.ytimg.com/vi/qe0RsmxEZec/maxresdefault.jpg",
    instruments: "Vocals",
    address: "Barnwell, South Carolina, USA"
  },
  {
    name: "John Doe",
    bio: "John Doe is a multi-instrumentalist blending various genres. He plays guitar, piano, drums, and violin.",
    image_url: "https://th.bing.com/th/id/OIP.LuE7kwG2B8SunikDvzhgVQHaE8?rs=1&pid=ImgDetMain",
    address: "123 Harmony Lane, Music City",
    instruments: ["Guitar", "Piano", "Drums", "Violin"]
  },
  {
    name: "Jane Smith",
    bio: "Jane Smith is a classically trained pianist with a deep understanding of music theory.",
    image_url: "https://theconcertdatabase.com/sites/theconcertdatabase.com/files/jd.jpg",
    address: "456 Sonata Street, Piano Town",
    instruments: ["Piano"]
  },
  {
    name: "Bob Marley",
    bio: "Bob Marley is a reggae legend, blending soul and rhythm in iconic songs.",
    image_url: "https://i0.wp.com/africhroyale.com/wp-content/uploads/2020/08/bob-marley.jpg?fit=1200,1200&ssl=1",
    address: "1 Love Ave, Kingston, Jamaica",
    instruments: ["Guitar", "Vocals"]
  },
  {
    name: "Louis Armstrong",
    bio: "Louis Armstrong, iconic jazz figure, known for his trumpet and gravelly voice.",
    image_url: "https://wallpapers.com/images/hd/american-musician-and-vocalist-louis-armstrong-7qe7z9c4160env44.jpg",
    address: "789 Jazz Blvd, New Orleans, LA",
    instruments: ["Trumpet", "Vocals"]
  },
  {
    name: "Tina Turner",
    bio: "Tina Turner, iconic singer known for her powerful voice and stage presence.",
    image_url: "https://th.bing.com/th/id/OIP.RC5YfZUdffs0GPYUWox7ywHaK0?rs=1&pid=ImgDetMain",
    address: "321 Rock Road, Nutbush, TN",
    instruments: ["Vocals"]
  },
  {
    name: "Elvis Presley",
    bio: "Elvis Presley, the 'King of Rock and Roll,' transformed the music industry.",
    image_url: "https://media.gq-magazine.co.uk/photos/5d1396393bedf20055db67b3/master/w_1366%2cc_limit/Elvis-12-GQ-16Aug17_getty_b.jpg",
    address: "Graceland, Memphis, TN",
    instruments: ["Guitar", "Vocals"]
  },
  {
    name: "Beethoven",
    bio: "Ludwig van Beethoven, one of the greatest composers, bridging Classical and Romantic eras.",
    image_url: "https://th.bing.com/th/id/OIP.WjKXjy86_u4WVnobHo-IYQAAAA?rs=1&pid=ImgDetMain",
    address: "12 Symphony Lane, Bonn, Germany",
    instruments: ["Piano", "Orchestra"]
  },
  {
    name: "Mozart",
    bio: "Wolfgang Amadeus Mozart, a prolific Classical composer, wrote over 600 works.",
    image_url: "https://tmms.co.uk/wp-content/uploads/2023/01/imgpsh_fullsize_anim-5.png",
    address: "34 Sonata Square, Salzburg, Austria",
    instruments: ["Piano", "Violin", "Orchestra"]
  }
]

# Create users and assign each to a musician
musicians.each do |m|
  # Create a user for the musician
  user = User.create!(
    email: "#{m[:name].downcase.gsub(' ', '.')}@youtube.com",
    password: "password"
  )
  file = URI.parse(m[:image_url]).open
  # Create the musician and associate with the user
  new_musician = Musician.new(
    name: m[:name],
    bio: m[:bio],
    address: m[:address],
    user_id: user.id
  )
  new_musician.image.attach(io: file, filename: "#{user.id}.png", content_type: "image/png")
  new_musician.save!
  p "#{new_musician.name} seeded"
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

instruments.each do |instrument_attrs|
  musician = Musician.all.sample
  instrument = Instrument.new(instrument_attrs)
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
  { title: "Clarinet Beginner Tutorial", video_url: "https://www.youtube.com/watch?v=Izf5sGMI1CY", description: "Learn to play the clarinet from scratch." },
  { title: "Percussion Instruments Basics", video_url: "https://www.youtube.com/watch?v=5AdDacff0Nw", description: "An introduction to various percussion instruments." },
  { title: "Banjo Basics for Beginners", video_url: "https://www.youtube.com/watch?v=fn4YhHdhhUU", description: "Start learning the banjo with this beginner tutorial." },
  { title: "How to Play Mandolin for Beginners", video_url: "https://www.youtube.com/watch?v=DvDDGN1h36s", description: "A simple guide to playing the mandolin." },
  { title: "Trombone Beginner Tutorial", video_url: "https://www.youtube.com/watch?v=Ymt3UbVPBm4", description: "Learn the fundamentals of trombone playing." },
  { title: "Learn to Play the Oboe", video_url: "https://www.youtube.com/watch?v=uCTo04Q_MvE", description: "Beginner's guide to playing the oboe." },
  { title: "Accordion Tutorial for Beginners", video_url: "https://www.youtube.com/watch?v=cvssDTDDgOU", description: "Learn to play the accordion with this beginner video." },
  { title: "Djembe Drumming Basics", video_url: "https://www.youtube.com/watch?v=n65_ZOh7jag", description: "Start drumming with this djembe tutorial." },
  { title: "Beginner Lessons on Recorder", video_url: "https://www.youtube.com/watch?v=9KZbADc2I8g", description: "Learn to play the recorder in simple steps." }
]

all_musicians = Musician.all.to_a
compositions.each_with_index do |comp_data, index|
  musician = all_musicians[index % all_musicians.size] # cycle through musicians
  comp = musician.compositions.create!(comp_data)

  # Randomly assign some instruments to this composition
  # Let's say each composition gets between 1 to 3 instruments.
  available_instruments = Instrument.all.to_a
  chosen_instruments = available_instruments.sample(rand(1..3))
  chosen_instruments.each do |instr|
    comp.instruments << instr
  end
end
puts "#{Composition.count} compositions seeded with instruments assigned."

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

# Seed many more realistic posts
sample_post_contents = [
  "I'm looking for tips on improving my vibrato technique on violin.",
  "Anyone else here obsessed with old-school blues guitar riffs?",
  "Just discovered the coolest saxophone solo in a classic jazz record!",
  "What are your thoughts on using digital tools for composition?",
  "I started learning piano last month, can anyone suggest beginner-friendly pieces?",
  "Does anyone have advice on maintaining trumpet embouchure during long practice sessions?",
  "I love reggae rhythms, they always lift my mood!",
  "I'm struggling to record a clean acoustic guitar track, any mic recommendations?",
  "Has anyone tried composing in unusual time signatures?",
  "I'm fascinated by Beethoven's later works – the complexity is mind-blowing.",
  "Rock and roll still lives strong in my heart!",
  "Classical guitar or flamenco guitar – which style is harder to master?",
  "I'm planning a live jam session in my city, who wants to join?",
  "Nina Simone's voice just hits different, doesn't it?",
  "I need advice on finding a good piano teacher in Chicago.",
  "Any tips for a beginner drummer looking to improve footwork speed?",
  "How do you incorporate electronic elements into jazz compositions tastefully?",
  "I just learned the basics of ukulele, super fun instrument!",
  "Flute players: how do you keep a consistent tone in higher registers?",
  "I've been experimenting with the harmonica – underrated instrument!"
]

# Create a lot more posts
50.times do
  Post.create!(
    content: sample_post_contents.sample,
    forum: Forum.all.sample,
    musician: Musician.all.sample
  )
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
  { content: "Louis Armstrong's music has so much soul.", musician_id: Musician.all.sample.id, composition_id: Composition.all.sample.id }
]
feedbacks.each do |feedback|
  Feedback.create!(feedback)
end
puts "#{Feedback.count} feedbacks seeded"

puts "------------------------------------------------------------------"
puts "Database seeded successfully!"
