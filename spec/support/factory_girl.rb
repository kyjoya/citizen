require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :state do
    sequence(:name) { |n| "state #{n}" }
  end

  factory :petition do
    name "A petition to save the world"
    description "I would like you to sign this so I can save the world."
    owner_id 1
    state
  end
end
