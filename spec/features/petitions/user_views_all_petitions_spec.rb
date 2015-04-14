require 'rails_helper'

feature 'user sees all petitions for a state' do

  before do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)
  end

  scenario 'user visits petition link on specific state page and sees all petitions' do
    state = FactoryGirl.create(:state)
    petition = FactoryGirl.create(:petition)

    visit state_petitions_path(state)

    expect(page).to have_content(petition.name)
    expect(page).to have_content(petition.description)
    expect(page).to have_content(petition.owner_id)
  end
end
