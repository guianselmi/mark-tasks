Given("I'm authenticated with {string} and {string}") do |email, password|
  @login.load
  @login.do_login(email, password)
end

Given("I access my profile") do
  @tasks.navbar.user_menu.click
  @tasks.navbar.my_profile.click
end

When("I complete my register with {string} and {string}") do |company, role|
  @profile.update(company, role)
end

Then("I see the message {string}") do |message|
  expect(@profile.form).to have_content message
end