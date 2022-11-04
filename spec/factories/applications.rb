FactoryBot.define do
  factory :application do
    sequence(:name) { |n| "App#{(n)}" }
  end
end
