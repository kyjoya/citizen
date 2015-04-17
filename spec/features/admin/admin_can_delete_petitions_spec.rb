require 'rails_helper'

feature 'admin is able to delete petitions' do
  scenario 'admin deletes petition' do
    visit new_user_session_path

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    petition = FactoryGirl.create(:petition)

    visit admin_petitions_path

    click_on 'Delete Petition'

    expect(page).to_not have_content(petition.name)
  end
end
