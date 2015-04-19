require 'rails_helper'

feature 'user signs a petition' do
  before do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)
  end

  scenario 'users can sign a petition' do
    petition = FactoryGirl.create(:petition)
    user = FactoryGirl.create(:user)

    visit state_petition_path(state_id: petition.state.name, id: petition.id)

    click_on "Sign Petition"

    expect(page).to have_content("You've signed this petition!")
    expect(page).to have_content(user.first_name)
  end
end
