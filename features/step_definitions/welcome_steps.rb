Given("I am not authenticated") do
end

When("I go to the welcome page") do
 visit(root_path)
end

Then("I must see the welcome's page content") do
  expect(page).to have_content('Chattie')
  expect(page).to have_content('Start')
end