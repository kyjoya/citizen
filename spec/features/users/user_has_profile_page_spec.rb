require 'rails_helper'

feature 'user can view and update information from a user profile page' do
  scenario 'user visits their profile page' do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    visit user_path(user)

    expect(page).to have_content(user.email)
  end
end
