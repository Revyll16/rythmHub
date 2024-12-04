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


musicians = [
  {
    name: "John Doe",
    bio: "John Doe is a multi-instrumentalist known for his eclectic style that blends various genres, from classical to jazz, rock, and electronic. His musical journey began at an early age when he first picked up a guitar at the age of seven. Over the years, John honed his skills on a variety of instruments, including piano, drums, and violin. His ability to adapt to any musical environment has earned him collaborations with artists from different genres, which has influenced his distinctive sound. In his early career, he joined a local rock band that gained popularity in his hometown, but soon realized his passion lay in experimenting with different instruments and sounds. John has released multiple solo albums, each showcasing his versatility as a composer and performer. His music is often described as innovative, blending modern electronic beats with traditional acoustic instruments. Beyond his work as a musician, John is also an advocate for music education and has taught music in various schools across the country. His performances are known for their energy and creativity, often featuring intricate improvisation and unexpected twists. John’s influence extends beyond the stage, with several of his compositions being featured in films and television shows. When he’s not performing, John enjoys collaborating with young, up-and-coming artists, sharing his knowledge and passion for music. His ability to mix different cultural influences into his music has made him a global sensation. John’s music continues to inspire countless musicians around the world, cementing his place as a true innovator in the music industry.",
    image_url: "https://th.bing.com/th/id/OIP.LuE7kwG2B8SunikDvzhgVQHaE8?rs=1&pid=ImgDetMain",
    address: "123 Harmony Lane, Music City"
  },
  {
    name: "Jane Smith",
    bio: "Jane Smith is a classically trained pianist with a passion for composition and a deep understanding of music theory. From a young age, she was recognized for her exceptional talent, earning a scholarship to one of the most prestigious music conservatories in the world. Jane’s early influences were composers like Chopin, Debussy, and Rachmaninoff, whose works she studied meticulously. Throughout her career, she has developed a unique style that combines the emotional depth of classical music with modern elements. Jane has performed at some of the world’s most renowned concert halls, captivating audiences with her powerful and emotive performances. In addition to her solo career, she has collaborated with orchestras, chamber ensembles, and contemporary artists. Jane is known for her meticulous attention to detail and her ability to interpret complex pieces with precision and feeling. Over the years, she has composed several original works that have been performed internationally, ranging from solo piano pieces to orchestral compositions. Her compositions are known for their lush harmonies and evocative melodies that transport listeners to another world. Jane is also a passionate educator and has taught piano and composition for many years, nurturing the next generation of musicians. When she’s not composing or performing, Jane enjoys attending music festivals and supporting fellow musicians in the classical and contemporary scenes. Her deep love for music and her commitment to her craft continue to inspire those who hear her work.",
    image_url: "https://th.bing.com/th/id/R.d35ff56255afd9012eb7319d478c6e62?rik=zWoURL%2b9N3faHA&riu=http%3a%2f%2felissagayle.ebersold.org%2fblog%2fwp-content%2fuploads%2f2019%2f04%2f190412_MoriahFormica_ElissaEbersold_ConcertPhotography-lg-12.jpg&ehk=AO%2bQf%2bXrAF58qzjbRGi6lC4WE%2bHuuYRbuUTRYzpE%2b5A%3d&risl=&pid=ImgRaw&r=0",
    address: "456 Sonata Street, Piano Town"
  },
  {
    name: "Bob Marley",
    bio: "Bob Marley is a reggae legend, blending soul and rhythm to create some of the most iconic songs in music history. Born in Jamaica, Bob’s early life was shaped by the sounds of traditional Jamaican music, but it was the influence of R&B and soul that made his music universally loved. His breakthrough came in the 1970s with the formation of the band, The Wailers, whose mix of reggae, rock, and soul was revolutionary. Marley's music speaks of love, unity, and social justice, making him an enduring voice for peace and equality. Songs like 'One Love,' 'No Woman, No Cry,' and 'Redemption Song' continue to resonate with audiences around the world. Bob's use of Rastafarian spirituality and messages of hope in his music turned him into a global ambassador for peace. His tours took him to all corners of the world, where he spread his philosophy of love and understanding. Despite his untimely death in 1981, Bob Marley’s influence continues to grow, with his music being celebrated by new generations of fans. His legacy lives on in the cultural impact of reggae music, and his life’s work continues to inspire musicians across all genres. Outside of music, Bob was also an activist, working to bring attention to the social and political struggles of his native Jamaica. Through his dedication to his music and his unwavering commitment to spreading a message of peace and unity, Bob Marley will forever be remembered as one of the most influential musicians of all time.",
    image_url: "https://i0.wp.com/africhroyale.com/wp-content/uploads/2020/08/bob-marley.jpg?fit=1200,1200&ssl=1",
    address: "1 Love Ave, Kingston, Jamaica"
  },
  {
    name: "Louis Armstrong",
    bio: "Louis Armstrong, one of the most iconic figures in jazz history, is renowned for his unique trumpet playing and his deep, gravelly voice. Born in New Orleans, he grew up in poverty but found solace in music, playing in local brass bands before making his way to Chicago. It was there that he became a leading figure in the birth of jazz, revolutionizing the genre with his improvisational skills and musical creativity. Known affectionately as 'Satchmo,' Louis Armstrong’s performances were characterized by his infectious smile, exuberant stage presence, and improvisational genius. He was not only a brilliant trumpet player but also a gifted vocalist, with his renditions of songs like 'What a Wonderful World' and 'Stardust' becoming timeless classics. Throughout his career, Armstrong performed with jazz legends like Earl Hines and Fletcher Henderson, but it was his own bands that cemented his place in music history. As a cultural ambassador, Louis toured the world, spreading the joy of jazz and captivating audiences with his music. Armstrong’s influence extended far beyond the jazz community, and his contributions to music helped shape the future of not only jazz but also pop, blues, and soul. His impact on the world of music cannot be overstated, and his legacy lives on through his recordings, which continue to inspire musicians today. Louis Armstrong passed away in 1971, but his legacy endures, and he remains a beacon of musical excellence.",
    image_url: "https://wallpapers.com/images/hd/american-musician-and-vocalist-louis-armstrong-7qe7z9c4160env44.jpg",
    address: "789 Jazz Blvd, New Orleans, LA"
  },
  {
    name: "Tina Turner",
    bio: "Tina Turner is an iconic singer known for her powerful voice and stage presence, making her one of the most influential artists in music history. Born Anna Mae Bullock in Nutbush, Tennessee, Tina started her career as a backing vocalist before joining Ike Turner’s band. Her breakthrough came when she and Ike formed the duo 'Ike & Tina Turner,' which earned her a reputation for her electrifying performances and fierce vocals. After a tumultuous personal life, Tina found success as a solo artist in the 1980s with hits like 'What's Love Got to Do with It' and 'Private Dancer.' Tina’s voice is recognized for its strength, passion, and raw emotion, and she became a symbol of resilience and empowerment. Throughout her career, she faced adversity, but she always rose above it, both personally and professionally. With over 100 million records sold worldwide, Tina Turner became a living legend. Her music combines rock, soul, and rhythm and blues, influencing generations of artists. Her autobiography and the film adaptation of her life story, 'What's Love Got to Do with It,' cemented her place as an enduring icon. Tina Turner’s music continues to inspire fans around the world, and her influence on pop and rock music is undeniable. She was inducted into the Rock and Roll Hall of Fame twice—once as part of Ike & Tina Turner and once as a solo artist. Today, Tina’s legacy continues to inspire and empower individuals, and she remains a true pioneer of rock and roll.",
    image_url: "https://th.bing.com/th/id/OIP.1QwP9QoJ1l2I5UfWTY_tcQAAAA?rs=1&pid=ImgDetMain",
    address: "321 Rock Road, Nutbush, TN"
  },
  {
    name: "Elvis Presley",
    bio: "Elvis Presley, often referred to as the 'King of Rock and Roll,' revolutionized the music industry and changed the cultural landscape of the 20th century. Born in Tupelo, Mississippi, Elvis grew up in a modest household but was always surrounded by music, which influenced his love for gospel, blues, and country. His breakthrough came in 1956 with his first single 'Heartbreak Hotel,' and he soon became a cultural icon. Elvis's unique voice and dynamic stage presence made him a sensation, and he was the first artist to truly bridge the gap between rhythm and blues, country, and pop. His influence on the music industry is immeasurable, with hits like 'Jailhouse Rock,' 'Hound Dog,' and 'Can't Help Falling in Love.' Elvis's rise to fame was meteoric, but he faced numerous challenges, including controversies surrounding his appearance and rebellious style. Despite this, he became a symbol of youthful energy and freedom, reshaping popular culture. Beyond his music, Elvis also became a major film star, starring in over 30 movies. His personal life, including his marriage to Priscilla Presley and his time at Graceland, became the subject of media scrutiny, but it did not overshadow his immense contributions to music. Even after his death in 1977, Elvis's influence remained potent, and he is still regarded as one of the best-selling music artists in history. Graceland remains a pilgrimage site for fans worldwide, and his legacy continues to inspire artists across multiple genres.",
    image_url: "https://media.gq-magazine.co.uk/photos/5d1396393bedf20055db67b3/master/w_1366%2cc_limit/Elvis-12-GQ-16Aug17_getty_b.jpg",
    address: "Graceland, Memphis, TN"
  },
  {
    name: "Beethoven",
    bio: "Ludwig van Beethoven, born in 1770 in Bonn, Germany, is regarded as one of the greatest composers in the history of Western music. His works revolutionized classical music, bridging the gap between the Classical and Romantic periods. Beethoven’s early music was influenced by his predecessors, such as Haydn and Mozart, but his later compositions defied traditional structures and norms. His Symphony No. 5 and Symphony No. 9, which features the famous 'Ode to Joy,' are two of the most celebrated and widely performed works in the classical repertoire. Beethoven’s music is known for its emotional depth, dramatic intensity, and innovation. Despite becoming progressively deaf in his later years, Beethoven continued to compose groundbreaking music, with his final symphonies and piano sonatas serving as a testament to his brilliance. His life was filled with personal struggles, including financial difficulties, health issues, and family problems, but he remained dedicated to his art. Beethoven was a trailblazer who pushed the boundaries of music, exploring new forms and breaking traditional molds. His influence on composers and musicians around the world is immeasurable, and his legacy continues to inspire music lovers and artists to this day. Beethoven’s music remains integral to both the classical music world and modern popular culture. He is often regarded as the archetype of the tortured genius, and his compositions continue to be studied and performed by musicians around the world.",
    image_url: "https://th.bing.com/th/id/OIP.WjKXjy86_u4WVnobHo-IYQAAAA?rs=1&pid=ImgDetMain",
    address: "12 Symphony Lane, Bonn, Germany"
  },
  {
    name: "Mozart",
    bio: "Wolfgang Amadeus Mozart, born in 1756 in Salzburg, Austria, was one of the most prolific and influential composers of the Classical era. His musical genius was apparent from a young age, and he began composing music at the age of five. Mozart composed over 600 works, including symphonies, operas, chamber music, and choral compositions, many of which are considered masterpieces. His works are characterized by their melodic beauty, structural perfection, and emotional depth. Some of his most famous works include 'The Magic Flute,' 'Eine kleine Nachtmusik,' and his Symphony No. 40 in G minor. Mozart's music transcended boundaries, and his influence can still be heard in a wide range of musical genres today. Despite his early death at the age of 35, Mozart’s music continues to captivate audiences worldwide. His ability to blend emotion with intellect and his mastery of musical forms set him apart from his contemporaries. Mozart’s legacy as a composer is unparalleled, and he remains an enduring figure in the classical music tradition. His life was marked by financial struggles and personal hardships, but he remained dedicated to his craft, composing some of his most important works during times of adversity. Mozart’s ability to create music that is both complex and accessible has ensured his place as one of the greatest composers in history.",
    image_url: "https://tmms.co.uk/wp-content/uploads/2023/01/imgpsh_fullsize_anim-5.png",
    address: "34 Sonata Square, Salzburg, Austria"
  }
]

musicians.each do |musician|
  Musician.create!(musician)
end
puts "#{Musician.count} musicians seeded"

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
