require 'rails_helper'

feature 'welcome page' do
  scenario 'welcome message' do
    visit root_path
    expect(page).to have_content('Connecting to the world')
    expect(page).to have_content('Chattie')
  end
end

