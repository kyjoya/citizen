states = [
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming",
]

states.each do |name|
  State.create(name: name)
end

if Rails.env.development?
  100.times do
    user = User.new(
      username: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      affiliation: %w(Republican Democrat Independent Undecided).sample,
      sign_in_count: 0
    )
    if user.valid?
      user.save!
    end
  end

  500.times do
    petition = Petition.new(
      name: Faker::Lorem.word,
      description: Faker::Lorem.paragraph(1, false),
      owner_id: rand(2..User.all.count),
      state_id: rand(2..State.all.count),
    )
    if petition.valid?
      petition.save!
    end
  end

  1000.times do
    signature = Membership.new(
      user_id: rand(2..User.all.count),
      petition_id: rand(2..Petition.all.count)
    )
    if signature.valid?
      signature.save!
    end
  end

end
