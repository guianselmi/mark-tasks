Given("I'm authenticated with {string} and {string}") do |email, password|
  visit 'https://marktasks.herokuapp.com'

  find('input[placeholder="example@gmail.com"]').set email
  find('input[type=password]').set password
  find('button[id*=btnLogin]').click
end

Given("I access my profile") do
  find('a[href="/user_settings dropdown-toggle"]').click
  find('#navbar a[href="/user_settings"]').click
end

When("I complete my register with {string} and {string}") do |company, role|
  find('input[name$=company]').set company
  role_combo = find('select[name$=job]')
  role_combo.find('option', text: role).select_option
  find('#form-submit-button').click
end

Then("I see the message {string}") do |message|
  profile_form = find('#user-settings-profile-edit-form')
  expect(profile_form).to have_content message
end