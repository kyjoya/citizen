require 'rails_helper'

feature 'user can create a new petition' do

    before do
      visit new_user_session_path

      user = FactoryGirl.create(:user)

      sign_in_as(user)
    end

  scenario 'user creates new petition for others to sign' do
    state = FactoryGirl.create(:state)

    visit state_petitions_path(state)

    fill_in 'Name', with: "A petition to end all petitions"
    fill_in 'Description', with: "I really hate petitions and want them to be banned."
    attach_file("petition_image",
     "#{Rails.root}/spec/fixtures/wellness-south-america-parrots.png")
    click_on 'Submit'

    expect(page).to have_content("A petition to end all petitions")
    expect(page).to have_content("I really hate petitions and want them to be banned.")
    expect(page).to have_css("img[src*='/wellness-south-america-parrots.png']")
    expect(page).to have_content("Added")
  end

  scenario 'user creates invalid petition for others to sing' do
    state = FactoryGirl.create(:state)

    visit state_petitions_path(state)

    click_on 'Submit'

    expect(page).to have_content("Not valid. Please provide a name and description.")
  end
end
