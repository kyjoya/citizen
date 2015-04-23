require 'rails_helper'

feature 'user can fill out voter registration form and save it' do
  # scenario 'user fills out entire form' do
  #   visit registration_path
  #
  #   fill_in 'Birth Date' #month day year menu
  #   fill_in 'Gender' #select
  #   fill_in 'Address 1'
  #   fill_in 'Address 2'
  #   fill_in 'City'
  #   fill_in 'County'
  #   fill_in 'State' #select menu
  #   fill_in 'Zip Code' #need validations
  #   fill_in 'Purpose' #new, address, name, party change
  #   fill_in 'Party Affiliation' #democratic, republican, libertarian, unaffiliated, minor
  #   fill_in 'Id' #social security or drivers id
  #   click_on 'Submit'
  #
  #   expect(page).to have_content("Success!")
  # end

  scenario 'user fills out partial form and saves it'
end
