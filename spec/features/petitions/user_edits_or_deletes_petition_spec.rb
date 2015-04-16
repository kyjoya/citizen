require 'rails_helper'

feature 'user can edit or delete a petition from their user home page' do

  scenario 'user visits their user profile page and can edit a petition' do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    petition = FactoryGirl.create(:petition, owner_id: user.id)

    visit edit_state_petition_path(id: petition.id, state_id: petition.state_id)

    fill_in 'Name', with: "A brand new title."
    click_on 'Update'

    expect(page).to have_content("A brand new title")
    expect(page).to_not have_content(petition.name)
  end

  scenario 'user unsuccessfully edits a petition' do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    petition = FactoryGirl.create(:petition, owner_id: user.id)

    visit edit_state_petition_path(id: petition.id, state_id: petition.state_id)

    fill_in 'Name', with: ""
    click_on 'Update'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'user visits their user profile page and can delete a petition' do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    petition = FactoryGirl.create(:petition, owner_id: user.id)

    visit user_path(user)

    click_on 'Delete Petition'

    expect(page).to_not have_content(petition.name)
  end
end
