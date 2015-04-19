require 'rails_helper'

feature 'user searches' do
  scenario 'user searches for a petition by name' do
    petition = FactoryGirl.create(:petition, name: "Climate change petition")
    petition_2 = FactoryGirl.create(:petition, name: "A stupid petition")
    visit petitions_path

    fill_in 'search', with: 'Climate'
    click_on 'Search Petitions'

    expect(page).to have_content('Climate change petition')
    expect(page).to_not have_content(petition_2.name)
  end
end
