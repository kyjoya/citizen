require 'rails_helper'

feature 'user clicks on state to view state details' do

  scenario 'visitor views state details page' do
    state = FactoryGirl.create(:state)

    visit state_path(state)
    expect(page).to have_content(state.name)
  end
end
