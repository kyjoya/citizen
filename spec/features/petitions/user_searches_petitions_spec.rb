require 'rails_helper'

feature 'user searches' do
  scenario 'user searches for a petition by name' do
    petition = FactoryGirl.create(:petition)
    petition_2 = FactoryGirl.create(:petition, name: "A stupid petition")
    visit petitions_path

    fill_in 'Search', with: 'Climate'
    click_on 'Submit'

    expect(page).to have_content('Climate change petition')
    expect(page).to_not have_content(petition.name)
  end
end
