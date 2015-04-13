require 'rails_helper'

feature 'user sees all petitions for a state' do

  before do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  scenario 'user visits petition link on specific state page and sees all petitions' do
    petition = FactoryGirl.create(:petition)
    state = FactoryGirl.create(:state)

    visit state_petitions_path(state)

    expect(page).to have_content(petition.name)
    expect(page).to have_content(petition.description)
    expect(page).to have_content(petition.owner_id)
  end
end
