FactoryBot.define do
  factory :user do
    sequence(:uid) {|n| "#{n}"}
    sequence(:token) {|n| "#{n}#{n}#{n}#{n}#{n}#{n}#{n}"}
    sequence(:token_secret) {|n| "#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}"}
    expires "5183999"
    name "Rick Roll"
    sequence(:email) {|n| "rickroll#{n}@example.com" }
  end
end
