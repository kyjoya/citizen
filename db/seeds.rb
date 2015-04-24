require 'httparty'

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
state_converter = {
  "AL" => 'Alabama',
  'AK' => "Alaska",
  "AZ" => 'Arizona',
  'AR' => "Arkansas",
  "CA" => 'California',
  'CO' => "Colorado",
  "CT" => 'Connecticut',
  'DE' => "Delaware",
  "FL" => 'Florida',
  'GA' => "Georgia",
  "HI" => 'Hawaii',
  'ID' => "Idaho",
  "IL" => 'Illinois',
  'IN' => "Indiana",
  "IA" => 'Iowa',
  'KS' => "Kansas",
  "KY" => 'Kentucky',
  'LA' => "Louisiana",
  "ME" => 'Maine',
  'MD' => "Maryland",
  "MA" => 'Massachusetts',
  'MI' => "Michigan",
  "MN" => 'Minnesota',
  'NE' => "Nebraska",
  "NV" => 'Nevada',
  'NM' => "New Hampshire",
  "NJ" => 'New Jersey',
  'NM' => "New Mexico",
  "NY" => 'New York',
  'NC' => "North Carolina",
  "ND" => 'North Dakota',
  'OH' => "Ohio",
  "OK" => 'Oklahoma',
  'OR' => "Oregon",
  "PA" => 'Pennsylvania',
  'RI' => "Rhode Island",
  "SC" => 'South Carolina',
  'SD' => "South Dakota",
  "TN" => 'Tennessee',
  'TX' => "Texas",
  "UT" => 'Utah',
  'VT' => "Vermont",
  "VA" => 'Virginia',
  'WA' => "Washington",
  'WV' => "West Virginia",
  'WI' => "Wisconsin",
  'WY' => "Wyoming"
}


words = ["economy", "women", "poverty", "business", "jobs", "health", "energy", "workers"]

states.each do |name|
  State.find_or_create_by(name: name)
end

# states.each do |state|
# abbreviation = state_converter[state]

words.each do |word|
  url = "http://www.capitolwords.org/api/1/phrases/state.json?phrase=#{word}&page=0&per_page=50&sort=count&apikey=#{ENV["SUNLIGHT_KEY"]}"
  results = HTTParty.get(url)["results"]

  results.each do |hash|
    state = State.find_by(name: state_converter[hash["state"]])
    StateWordCount.find_or_create_by(state_id: state.id, count: hash["count"], word: word) if state
  end
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
      name: "Petition",
      description: Faker::Lorem.paragraph(2, false),
      owner_id: rand(2..User.all.count),
      state_id: rand(2..State.all.count),
    )
    if petition.valid?
      petition.save!
    end
  end

  5000.times do
    signature = Membership.new(
      user_id: rand(2..User.all.count),
      petition_id: rand(2..Petition.all.count)
    )
    if signature.valid?
      signature.save!
    end
  end

end
