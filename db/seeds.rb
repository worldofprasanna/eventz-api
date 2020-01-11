conference = Conference.create(title: 'Hello World Conference', description: 'This is the first conference being created in the system', location: 'Bangalore', image_url: 'some_url', start_date: Time.now, duration: '2 days', price: 5000)

prasanna = Speaker.create(name: 'Prasanna', role: 'Architect', linkedin_handle: 'linkedin.com/worldofprasanna', twitter_handle: '@worldofprasanna', github_handle: '@worldofprasanna', company: 'Francium Tech', company_logo: 'some logo', profile_pic: 'some image url')

conference.talks.create(title: 'Building scalable applications', description: 'Build a scalable appliation leveraging cloud, IAAC, Containers', speaker: prasanna, start_time: Time.now, talk_type: 'Cloud Computing')