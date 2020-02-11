FactoryBot.define do
  factory :promo_code do
    name { 'Sample promo code' }
    code { 'CODE1' }
    discount { 10 }
  end
end
