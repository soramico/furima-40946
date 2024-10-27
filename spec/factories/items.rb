FactoryBot.define do
  factory :item do
    association :user

    product_name          { Faker::Name.name }
    product_description   { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 1, to: 10) }
    condition_id          { Faker::Number.between(from: 1, to: 6) }
    contribution_id       { Faker::Number.between(from: 1, to: 2) }
    prefecture_id         { Faker::Number.between(from: 1, to: 47) }
    deliveryday_id        { Faker::Number.between(from: 1, to: 3) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
