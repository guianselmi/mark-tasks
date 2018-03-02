Given('I accessed the registration page') do
  visit '/register'
end

Given('I have the following info:') do |table|
  @register = table.rows_hash
end

When('I register') do
  # fill_in only works with ID and Names
  fill_in 'register_name', with: @register['Name']
  fill_in 'register_email', with: @register['Email']
  find('input[type=password]').set @register['Password']

  find('button[type=submit]').click
end

Then("I'm redirected to the task panel") do
  expect(page).to have_content 'Todas as minhas tarefas'
end

Then('I should see the alert message {string}') do |alert_message|
  expect(page).to have_content alert_message
end