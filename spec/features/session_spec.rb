require "rails_helper"

xfeature "Session", type: :feature do
  before(:all) do
    @user = FactoryBot.create(:user, username: "janedoe")
  end
  scenario "allows a user to log in" do
    visit root_path
    click_on "Sign in"
    fill_in "Username or email", with: @user.username
    fill_in "Password", with: @user.password
    click_button "Sign in"
    expect(page).to have_content "Signed in successfully."
  end

  scenario "does not allow user to log in with invalid credentials" do
    visit root_path
    click_on "Sign in"
    fill_in "Username or email", with: @user.username
    fill_in "Password", with: "478279"
    click_button "Sign in"
    expect(page).to have_content "Invalid Username or email or password."
  end
end
