require "rails_helper"

xfeature "Registration", type: :feature do
  scenario "allows a user to register" do
    fill_form
    expect(page).to have_content "Welcome! You have signed up successfully"
  end

  scenario "does not allow a user to register with invalid credentials" do
    fill_form
    expect(page).to have_content "Sign up"
  end

  def fill_form
    visit root_path
    click_on "Sign up"
    fill_in "First name", with: "Oluwaseun"
    fill_in "Last name", with: "Adekunle"
    fill_in "Username", with: "seun"
    fill_in "Email", with: "seun.adekunle@andela.com"
    fill_in "Job description", with: "Software Developer"
    fill_in "Password", with: "userpassword"
    fill_in "Password confirmation", with: "userpassword"
    click_button "Sign up"
  end
end
