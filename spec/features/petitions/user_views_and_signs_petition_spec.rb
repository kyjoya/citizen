require 'rails_helper'

feature 'user signs a petition' do
  before do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)
  end

  scenario 'users can sign a petition' do
    petition = FactoryGirl.create(:petition)

    visit state_petition_path(id: petition.id, state_id: petition.state_id)

    click_on "Sign Petition"

    expect(page).to have_content("You've signed this petition!")
  end

  scenario 'user tries to sign petition twice' do
    petition = FactoryGirl.create(:petition)

    visit state_petition_path(id: petition.id, state_id: petition.state_id)
    click_on "Sign Petition"

    expect(page).to_not have_content("Sign Petition")
  end

  scenario 'user can comment on a petition'
end
