require "rails_helper"
require "spec_helper"

describe "Chatrooms", type: :feature do
  before(:all) do
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end

  after(:all) do
    Warden.test_reset!
  end

  scenario "allows an authenticated user create a new chatroom", js: true do
    visit chatrooms_path
    expect(page).to have_content "Chatrooms"
    click_on "New Chatroom"
    expect(page).to have_content "New Chatroom"
    fill_in("Name", with: "Lagos-all")
    click_on "Create Chatroom"
    expect(page).to have_content "Chatroom was successfully created."
    expect(page).to have_content "Lagos-all"
    expect(page).to have_content "Direct Messages"
  end
end
