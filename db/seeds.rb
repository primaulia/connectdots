require 'faker'

def printStats
  puts ''
  puts "End of Seed Run - count of table rows:"
  puts ''
  puts "Users       : #{User.all.count}"
  puts "Connections : #{Connection.all.count}"
  puts "Messages    : #{Message.all.count}"
  puts "Topics      : #{Topic.all.count}"
  puts "Courses     : #{Course.all.count}"
  puts "Roadmaps    : #{Roadmap.all.count}"
  puts "Courses-Roadmaps Join Table : #{CourseRoadmap.all.count}"
end

def seedTopics
  puts "Proceeding to seed 7 Topics ...."

  idx = 0
  topics_list = [ 'Master Plan', 'Bootcamp', 'HTML', 'JavaScript', 'CSS', 'Git/Github', 'Databases' ]

  Topic.destroy_all
  
  7.times do
    puts "Creating Topic #{idx + 1} - #{topics_list[idx]}"
    Topic.create!(name: topics_list[idx])
    idx += 1
  end  
end

def seedCourses
  puts "Proceeding to seed 30 Courses ...."

  providers = [ 
  'Le Wagon',
  'Le Wagon',
  'Brent Global College',
  'Vdemy',
  'Fulltack Academy',
  'Vdemy',
  'SpillsFuture',
  'ScalyFish',
  'JollyRoger',
  'Bursera',
  'ScalyFish',
  'JollyRoger',
  'Vdemy',
  'QueSeraSera',
  'Bursera',
  'Jack Sparrow School',
  'Vdemy',
  'SpillsFuture',
  'JollyRoger',
  'Bursera',
  'Vdemy',
  'SpillsFuture',
  'ScalyFish',
  'JollyRoger',
  'Bursera',
  'Jack Sparrow School',
  'Jack Sparrow School',
  'JollyRoger',
  'JollyRoger',
  'Bursera'
  ]

  titles = [
    'Web Development Part Time',
    'Web Development Full Time',
    'Software Development BootCamp',
    'Full Stack Web Dev Bootcamp',
    'Live Online Coding Bootcamp',
    'HTML & CSS Online Course',
    'Rapid Website Design',
    'HTML & CSS',
    'HTML & CSS Basics',
    'HTML & CSS Fundamentals',
    'Javascript Online',
    'Javascript Basics',
    'Javascript Fundamentals',
    'Pronto Master Javascript',
    'Rectangular JS',
    'HTML & CSS Online!',
    'Rapid Website Design',
    'HTML & CSS Basics',
    'HTML & CSS Fundamentals',
    'HTML & CSS Basics',
    'Git/Github Basics',
    'Git/Github Fundamentals',
    'Git/Github Pronto!',
    'Git/Github Immersive',
    'Git Set Go !',
    'SQLite3',
    'PostgreSQL',
    'MongoDB Atlas',
    'mySQL with innoDB and NDB',
    'DB DB Duh Duh'
  ]

  course_fees = [ 10000, 10000, 15000, 150, 500, 250, 250, 300, 500, 0, 1000, 750, 250, 0, 0, 1000, 0, 200, 300, 0, 150, 250, 350, 550, 0, 250, 1000, 2600, 2900, 0 ]

  # durations = [ 2, 4, 6, 18, 36, 48, 52 ]
  durations = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
  hours_per_week_values = [ 10, 15, 20, 25, 40 ]
  
  topics_in_table = Topic.all

  idx = 0
  
  Course.destroy_all

  30.times do
    if idx == 0
      course_url = "https://www.lewagon.com/singapore"
      course_duration = 6
      hours_per_week = 12
    elsif idx == 1
      course_url = "https://www.lewagon.com/singapore"
      course_duration = 2
      hours_per_week = 40
    else
      course_url = Faker::Internet.url
      course_duration = durations.sample
      hours_per_week = hours_per_week_values.sample
    end

    provider = providers[idx]
    title = titles[idx]
    course_fee = course_fees[idx]
    
    if idx < 5
      course_topic_id = topics_in_table[1].id
    elsif idx < 10
      course_topic_id = topics_in_table[2].id
    elsif idx < 15
      course_topic_id = topics_in_table[3].id
    elsif idx < 20
      course_topic_id = topics_in_table[4].id
    elsif idx < 25
      course_topic_id = topics_in_table[5].id
    else
      course_topic_id = topics_in_table[6].id
    end

    puts "Creating Course #{idx + 1} - #{title} - #{provider}"

    Course.create!(
      provider: provider,
      title: title,
      cost: course_fee,
      duration: course_duration,
      provider_url: course_url,
      hourse_per_week: hours_per_week,
      topic_id: course_topic_id
    )
    idx += 1
  end
end 

def seedRoadmaps
  puts "Proceeding to seed 30 Roadmaps for 30 Users ...."

  Roadmap.destroy_all

  start_dates = [ 
    '1-Feb-19', 
    '1-Mar-19', 
    '1-Apr-19', 
    '1-May-19', 
    '1-Jun-19', 
    '1-Jul-19', 
    '1-Aug-19', 
    '1-Sep-19', 
    '1-Oct-19', 
    '1-Nov-19', 
    '1-Dec-19', 
    '1-Jan-20', 
    '1-Feb-20', 
    '1-Mar-20', 
    '1-Apr-20', 
    '1-May-20', 
    '1-Jun-20', 
    '1-Jul-20', 
    '1-Aug-20', 
    '1-Sep-20', 
    '1-Oct-20', 
    '1-Nov-20', 
    '1-Dec-20', 
    '1-Jan-21', 
    '1-Feb-21', 
    '1-Mar-21', 
    '1-Apr-21', 
    '1-May-21', 
    '1-Jun-21', 
    '1-Jul-21'
  ]

  end_dates = [
    '31-Jul-19', 
    '27-Oct-19', 
    '30-Jun-19', 
    '29-Aug-19', 
    '29-Oct-19', 
    '28-Dec-19', 
    '27-Feb-20', 
    '28-May-20', 
    '31-Oct-19', 
    '30-Jan-20', 
    '26-Oct-20', 
    '26-Dec-20', 
    '28-Oct-20', 
    '26-Dec-20', 
    '27-Mar-21', 
    '30-Jun-20', 
    '29-Sep-20', 
    '28-Nov-20', 
    '31-Aug-20', 
    '28-Jun-21', 
    '26-Sep-21', 
    '31-Dec-20', 
    '31-Mar-21', 
    '31-May-21', 
    '03-Mar-21', 
    '26-Nov-21', 
    '01-May-21', 
    '30-Jul-21', 
    '27-Apr-22', 
    '27-Jan-22'
   ]

  rdmap_dur_array = [ 6, 8, 3, 4, 5, 6, 7, 9, 1, 3, 11, 12, 9, 10, 12, 2, 4, 5, 1, 10,12, 2, 4, 5, 1, 9, 1, 3, 11, 7 ]

  idx = 0
  users = User.all

  30.times do
    puts "Creating Roadmap #{idx + 1} - for user id #{users[idx].id}"
    d1 = Date.parse start_dates[idx]
    d2 = Date.parse end_dates[idx]
    roadmap_duration = rdmap_dur_array[idx]
    Roadmap.create!(
      privacy_option: false,
      start_date: d1,
      end_date: d2,
      duration: roadmap_duration,
      user_id: users[idx].id
    )
    idx += 1
  end
end

def seedCoursesRoadmapsJoinTable
  puts "Proceeding to seed combinations of Roadmaps and Courses ..."

  CourseRoadmap.destroy_all

  two_d_array = [
    [ 1, 4, 0, 0, 0, 0, 12, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 2, 5, 0, 9, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 0, 0, 9, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 29, 30, 0 ], 
    [ 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0 ], 
    [ 0, 3, 0, 0, 0, 0, 12, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 4, 0, 0, 0, 0, 12, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 2, 5, 0, 9, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 0, 0, 9, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 29, 30, 0 ], 
    [ 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0 ], 
    [ 0, 3, 0, 0, 0, 0, 12, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 4, 0, 0, 0, 0, 12, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 2, 5, 0, 9, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 0, 0, 9, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 29, 30, 0 ], 
    [ 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0 ], 
    [ 0, 3, 0, 0, 0, 0, 12, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 4, 0, 0, 0, 0, 12, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 2, 5, 0, 9, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 0, 0, 9, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 29, 30, 0 ], 
    [ 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0 ], 
    [ 0, 3, 0, 0, 0, 0, 12, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 4, 0, 0, 0, 0, 12, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 2, 5, 0, 9, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 0, 0, 9, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 29, 30, 0 ], 
    [ 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0 ], 
    [ 0, 3, 0, 0, 0, 0, 12, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 4, 0, 0, 0, 0, 12, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 2, 5, 0, 9, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ], 
    [ 1, 0, 0, 9, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 29, 30, 0 ], 
    [ 2, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0 ], 
    [ 0, 3, 0, 0, 0, 0, 12, 0, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0 ]
  ]
  
  statuses = [ "Completed", "In progress", "Yet to Start" ]

  courses = Course.all
  roadmaps = Roadmap.all

  idx = 0
  total_combos = 0

  30.times do
    roadmap_id = roadmaps[idx].id
    courses_array = two_d_array[idx]

    c_idx = 0
    18.times do
      course_to_get = courses_array[c_idx]
      
      if course_to_get > 0
        total_combos += 1
        course = courses[course_to_get - 1]

      puts "Creating Combo #{total_combos} for Roadmap #{roadmap_id} and course #{course.title}"
      CourseRoadmap.create!(
        status: statuses.sample,
        course_id: course.id,
        roadmap_id: roadmap_id,
        order: c_idx + 1
      )
      end
      c_idx += 1
    end
    idx += 1
  end
end

def seedUsers
  puts "Proceeding to seed 30 users ...."

  Message.destroy_all
  Connection.destroy_all
  User.destroy_all

  current_role = [
    'Marketing',
    'Design',
    'Product Management',
    'Copywriter',
    'Account Management',
    'Project Management',
    'Business Analysis',
    'Risk Management',
    'Human Resources',
    'Accountant',
    'Sales',
    'Customer Support',
    'Operation',
    'Research',
    'Instructor',
    'Consulting',
    'Self-employed',
    'Freelance'
  ] 

  current_ind =  [
    'Consulting',
    'Art/Design',
    'IT/Tech Agriculture',
    'Hospitality',
    'Law',
    'Leisure/Tourism',
    'Marketing/Advertising',
    'Media/Entertainment',
    'Public Services/Govt',
    'Retail',
    'Pharmaceuticals',
    'Self-employed',
    'Freelance'
  ]

  future_roles = [
    'Web Developer',
    'Product Manager',
    'Fullstack Engineering',
    'Frontend Developer',
    'Backend Developer',
  ]

  @satisfaction = [ 
    "Great", 
    "Fabulous", 
    "Super", 
    "Could be better", 
    "Nice !"]

  @src1 = 'https://images.pexels.com/photos/'
  @src2 = ''
  @src3 = '/pexels-photo-'
  @src5 = '.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=750&h=1260'

  men_faces = [ 
    749091, 
    977374, 
    1267335, 
    1546912, 
    2269872, 
    2341350, 
    2531553, 
    211476, 
    3370021, 
    3406022, 
    3754833, 
    4052800, 
    4061512, 
    6102841, 
    7431273 ]

  women_faces = [ 
    1520760, 
    1644924, 
    1691294, 
    1845993, 
    3021554, 
    3021563, 
    3394658, 
    3936894, 
    4258184, 
    5025111, 
    5649997, 
    6682475, 
    7073078, 
    7717254, 
    8219320 ]

  locations = [ 
    'Singapore',
    'Hong Kong',
    'Beijing',
    'Jakarta',
    'Melbourne',
    'New York',
    'Paris',
    'London',
    'Dubai',
    'New Delhi',
    'Seoul'
 ]

  i = 1
  j = 0
  k = 0

  30.times do
    
    if i.odd?
      @name1 = Faker::Name.female_first_name
      @img_url = "#{@src1}#{women_faces[k]}#{@src3}#{women_faces[k]}#{@src5}"
      k += 1
    else
      @name1 = Faker::Name.male_first_name
      @img_url = "#{@src1}#{men_faces[j]}#{@src3}#{men_faces[j]}#{@src5}"
      j += 1
    end

    @future_role = future_roles.sample
    user_email = "#{@name1}@#{Faker::Internet.domain_name}"

    puts "Creating User #{i} of 30 - #{user_email}"

    User.create!(
      first_name: @name1,
      email: user_email,
      password: "secret",
      last_name: Faker::Name.last_name,
      budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
      timeframe: [6, 12, 18, 24].sample,
      current_role: current_role.sample,
      current_industry: current_ind.sample,
      future_industry: 'Tech/IT',
      future_role: @future_role,
      available_hrs_per_week: [12, 24, 36, 40, 60].sample,
      status: ['Online', 'Offline'].sample,
      img_url: @img_url,
      advice: Faker::Quote.yoda,
      location: locations.sample,
      motivation: Faker::Quote.matz,
      journey_experience: Faker::Lorem.paragraph_by_chars(number: 512, supplemental:  false),
      satisfaction: @satisfaction.sample
      )
    i += 1
  end
end

def seedConnections
  puts "Proceeding to seed 100 connections ...."

  Message.destroy_all
  Connection.destroy_all

  # Get All the Users
  users = User.all
  
  i = 0
  j = 19

  # We will create connections data for the first 5 users that have been created
  # We will connect each of those users to Users 20 to 29 
  
  until i > 4 do
    puts "Seeding Connections for #{i+1} of 5 Users"
    j = 19
    until j > 29 do
      puts "User ##{i+1} with UsedId=#{users[i].id} <--- connected to ---> User ##{j+1} with UserId #{users[j].id}"
      Connection.create!(
        connecting_id: users[i].id,
        connecter_id: users[j].id,
        # user_id: users[i].id
      )
      j += 1
    end
    i += 1
  end
end

def seedMessages
  puts "Proceeding to seed 100 messages ...."
  Message.destroy_all
  i = 1

  connections = Connection.all
  
  pick_any = 0
  
  100.times do 
    puts "Seeding Messages #{i} of 100"
    if pick_any > 10
      pick_any = 0
    end

    rand = [0..6].sample
    if rand == 0
      @content = Faker::Quote.yoda
    elsif rand == 1
      @content = Faker::Quote.famous_last_words
    elsif rand == 2
      @content = Faker::Quote.jack_handey
    elsif rand == 3
      @content = Faker::Quote.matz
    elsif rand == 4
      @content = Faker::Quote.most_interesting_man_in_the_world
    elsif rand == 5
      @content = Faker::Quotes::Shakespeare.romeo_and_juliet_quote
    else
      @content = Faker::Quotes::Shakespeare.as_you_like_it_quote
    end

    Message.create!(
      content: @content,
      reaction: Faker::Quotes::Shakespeare.hamlet_quote ,
      connection_id: connections[pick_any].id,
      user_id: connections[pick_any].connecting_id,
    )
    i += 1
    pick_any += 1
  end
end

print `clear`
puts '*********************************'
puts '  Welcome to ConnectDots Seeding '
puts '*********************************'
puts ''
puts '1 - Users'
puts '2 - Connections'
puts '3 - Messages'
puts '4 - Topics'
puts '5 - Courses'
puts '6 - Roadmaps'
puts '7 - Courses-Roadmaps Join Table'
puts ''
puts '9 - Seed All tables'
puts ''
puts 'Press any other key to Exit'
puts ''
puts "Note:"
puts "- seeding Users will cleardown Messages and Connections as dependent objects"
puts "- seeding Connections will cleardown Messages as dependent objects"
puts ''
puts "If in doubt, select 9 and seed everything !"
puts ''
print '>'
input = STDIN.gets.chomp().to_i

if input == 1
  seedUsers
elsif input == 2
  seedConnections
elsif input == 3
  seedMessages
elsif input == 4
  seedTopics
elsif input == 5
  seedCourses
elsif input == 6
  seedRoadmaps
elsif input == 7
  seedCoursesRoadmapsJoinTable
elsif input == 9
  seedUsers
  seedConnections
  seedMessages
  seedTopics
  seedCourses
  seedRoadmaps
  seedCoursesRoadmapsJoinTable
else
  puts "Nothing to do? GoodBye !"
end


# Creating Users for Connectdots build team
print `clear`
puts "🏆🏆 Now Creating Users and Connections for the Connectdots Delta Force team !🏆🏆"

@nicole = User.create!(
  first_name: "Nicole",
  email: "leowminzi@gmail.com",
  password: "123456",
  last_name: "Leow",
  budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
  timeframe: [6, 12, 18, 24].sample,
  current_role: "Consultant",
  current_industry: "Banking",
  future_industry: "Tech/IT",
  future_role: "Web Developer",
  available_hrs_per_week: [12, 24, 36, 40, 60].sample,
  status: ['Online', 'Offline'].sample,
  img_url: "https://ca.slack-edge.com/T02NE0241-U01K3EYTT6Y-bc20a7c16358-512",
  advice: Faker::Quote.yoda,
  location: 'Singapore',
  motivation: Faker::Quote.matz,
  journey_experience: Faker::Lorem.paragraph_by_chars(number: 512, supplemental:  false),
  satisfaction: ""
) 

@minyoung = User.create!(
  first_name: "Minyoung",
  email: "minyoungchang65@gmail.com",
  password: "123456",
  last_name: "Chang",
  budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
  timeframe: [6, 12, 18, 24].sample,
  current_role: "Chairman",
  current_industry: "Insurance",
  future_industry: "Tech/IT",
  future_role: "Web Developer",
  available_hrs_per_week: [12, 24, 36, 40, 60].sample,
  status: ['Online', 'Offline'].sample,
  img_url: "https://ca.slack-edge.com/T02NE0241-U01JQJAF7S6-46eb625dbda2-512",
  advice: Faker::Quote.yoda,
  location: 'Singapore',
  motivation: Faker::Quote.matz,
  journey_experience: Faker::Lorem.paragraph_by_chars(number: 512, supplemental:  false),
  satisfaction: ""
) 

@chris = User.create!(
  first_name: "Chris",
  email: "chris@bootcamp.sg",
  password: "123456",
  last_name: "De Lima",
  budget: [500, 1000, 1500, 2000, 2500, 3000].sample,
  timeframe: [6, 12, 18, 24].sample,
  current_role: "Consultant",
  current_industry: "Finance",
  future_industry: "Tech/IT",
  future_role: "Web Developer",
  available_hrs_per_week: [12, 24, 36, 40, 60].sample,
  status: ['Online', 'Offline'].sample,
  img_url: "https://ca.slack-edge.com/T02NE0241-U01J21DET2T-5c4a15d1564a-512",
  advice: Faker::Quote.yoda,
  location: 'Singapore',
  motivation: Faker::Quote.matz,
  journey_experience: Faker::Lorem.paragraph_by_chars(number: 512, supplemental:  false),
  satisfaction: ""
) 

Connection.create!(
  connecting_id: @nicole.id,
  connecter_id: @minyoung.id
)

Connection.create!(
  connecting_id: @nicole.id,
  connecter_id: @chris.id
)

Connection.create!(
  connecting_id: @minyoung.id,
  connecter_id: @chris.id
)

printStats
