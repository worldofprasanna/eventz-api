FactoryBot.define do
  factory :conference do
    title { 'Conf1' }
    location { 'Bangalore' }
    description { 'Sample Conference' }
    image_url { 'https://google.com' }
    start_date { Time.now }
    price { 1000 }
    duration { '3 days' }
  end
end
