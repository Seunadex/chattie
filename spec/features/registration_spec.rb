require "rails_helper"

feature "Registration", type: :feature do
  scenario "allows a user to register" do
    visit root_path
    click_on "Register"
    fill_in "First name", with: "Oluwaseun"
    fill_in "Last name", with: "Adekunle"
    fill_in "Username", with: "seun"
    fill_in "Email", with: "seun.adekunle@andela.com"
    fill_in "Job description", with: "Software Developer"
    fill_in "Password", with: "userpassword"
    fill_in "Password confirmation", with: "userpassword"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully"
  end

  scenario "does not allow a user to register with invalid credentials" do
    visit root_path
    click_on "Register"
    fill_in "First name", with: "Oluwaseun"
    fill_in "Last name", with: "Adekunle"
    fill_in "Username", with: "seunad"
    fill_in "Email", with: "seun.adekunle@andela.com"
    fill_in "Job description", with: "Software Developer"
    fill_in "Password", with: "userpasswordss"
    fill_in "Password confirmation", with: "userpassword"
    click_button "Sign up"
    expect(page).to have_content "Sign up"
  end
end
