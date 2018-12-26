require "rails_helper"
require "spec_helper"

xdescribe "Set topic", type: :feature do
  before(:all) do
    user = FactoryBot.create(:user, username: "johndoe")
    login_as(user, scope: :user)
  end

  after(:all) do
    Warden.test_reset!
  end

  scenario "allows an authenticated user to set topic", js: true do
    visit chatrooms_path
    expect(page).to have_content "Chatrooms"
    click_on "New Chatroom"
    expect(page).to have_content "New Chatroom"
    fill_in("Name", with: "Lagos-alll")
    click_on "Create Chatroom"
    expect(page).to have_content "Chatroom was successfully created."
    expect(page).to have_content "Lagos-all"
    expect(page).to have_content "Direct Messages"
    click_on "Add a topic"
    expect(page).to have_content("New Topic")
    fill_in("Topic", with: "Some ridiculous chatroom")
    click_on "Set topic"
    expect(page).to have_content("Topic has been set.")
    expect(page).to have_content("Some ridiculous chatroom")
  end
end
