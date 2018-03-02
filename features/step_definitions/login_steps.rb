When('I log in with {string} and {string}') do |email, password|
  @email = email

  @login.load
  @login.do_login(email, password)
end

Then("I'm authenticated successfully") do
  expect(@tasks.navbar.user_menu.text).to eql @email
end

Then('I see my task panel') do
  expect(@tasks.title.text).to eql 'Painel de Atividades'
end

Then('I should see the message {string}') do |alert_message|
  expect(@login.alert.text).to eql alert_message
end

Then("I'm not authenticated") do
  expect(@tasks.has_no_title?).to be false
end