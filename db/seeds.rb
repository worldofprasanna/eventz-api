# This seed file is not in use.
# Instead use the rake task to load the data from csv file. rails data:populate

# conferences = [
#   {
#     title: 'The Second Annual CXO',
#     description: "India's Most Esteemed Gathering For 300+ CMOs And CXOs.",
#     location: 'ITC Windsor, Bengaluru',
#     duration: '3 days',
#     start_date: DateTime.new(2020, 02, 15),
#     price: 8500,
#     image_url: 'https://storage.googleapis.com/io-19-assets/images/recap/carousels/carousel-1_2x.jpg'
#   },
#   {
#     title: 'Arise HR Summit',
#     description: "India’s Innovative Human Resource Conference focused on the transformed roles in Human Resource Management",
#     location: 'Sterlings Mac Bengaluru',
#     duration: '2 days',
#     start_date: DateTime.new(2020, 02, 29),
#     price: 8500,
#     image_url: 'https://storage.googleapis.com/io-19-assets/images/recap/carousels/carousel-3_2x.jpg'
#   }
# ]

# conferences.each do |conference|
#   Conference.create(title: conference[:title], description: conference[:description], location: conference[:location], image_url: conference[:image_url], start_date: conference[:start_date], duration: conference[:duration], price: conference[:price])
# end

# prasanna = Speaker.create(name: 'Prasanna', role: 'Architect', linkedin_handle: 'worldofprasanna', twitter_handle: '@worldofprasanna', github_handle: '@worldofprasanna', company: 'Francium Tech', company_logo: 'some logo', profile_pic: 'https://worldofprasanna.in/img/prasanna-1.jpg', speaker_summary: 'Working as a Full Stack Developer & Architect with nearly 10 years of hands-on experience. Recently was more passionate about Devops and in understanding how the high available systems are implemented.', country: 'India', city: 'Chennai', birthday: '10/may/1988', languages_known: ['English', 'Tamil', 'Spanish'], mobile_number: '+91 90000 90000', about_page: 'https://worldofprasanna.in', email: 'prasannacse2005@gmail.com')

# Conference.first.talks.create(title: 'Building scalable applications', description: 'Build a scalable appliation leveraging cloud, IAAC, Containers', speaker: prasanna, start_time: Time.now, talk_type: 'Cloud Computing')

# Conference.last.talks.create(title: 'Building scalable applications', description: 'Build a scalable appliation leveraging cloud, IAAC, Containers', speaker: prasanna, start_time: Time.now, talk_type: 'Cloud Computing')

# Conference.last.talks.create(title: 'Building another scalable applications', description: 'Build a scalable appliation leveraging cloud, IAAC, Containers', speaker: prasanna, start_time: Time.now, talk_type: 'Cloud Computing')