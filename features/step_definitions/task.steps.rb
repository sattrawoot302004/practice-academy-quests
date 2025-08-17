
Given("I should at todo list page") do
  visit root_path
  expect(page).to have_current_path(root_path)
end

When("I fill text {string}") do |value|
 find('[data-testid="task-title-input"]').set(value)
end

When("I click create button") do
  find('[data-testid="create-task-button"]').click
end

Then("I shoud see {string} content") do |content|
   expect(page).to have_content(content)
end
