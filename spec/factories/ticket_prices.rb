FactoryBot.define do
  factory :ticket_price do
    price { 1.5 }
    conference { nil }
    ticket_type { "MyString" }
  end
end
