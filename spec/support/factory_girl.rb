require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'kylee'
    last_name 'acker'
    username 'kyjoya'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    role 'admin'
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

  factory :membership do
    user
    petition
  end
end
