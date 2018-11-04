

Given("I am an authenticated user") do
  @user = FactoryBot.create(:user)
  visit root_path
  click_on "Log in"
  fill_in "Username or email", with: @user.username
  fill_in "Password", with: @user.password
  click_button "Log in"
  expect(page).to have_content "Signed in successfully."
end

Given("there is a public chatroom") do
  @chatroom = FactoryBot.create(:public_chatroom, name: "general")
end

When("I go a public chatroom") do
  visit(chatroom_path(@chatroom.id))
end

Then("I must see the name of the chatroom") do
  expect(page).to have_content("general")
  expect(page).to have_content("About general")
end

Then("I must see my username") do
  expect(page).to have_content(@user.username)
end

Then("I must see direct messages") do
  expect(page).to have_content("Direct Messages")
end
