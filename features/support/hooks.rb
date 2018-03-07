Before do
  visit "https://marktasks.herokuapp.com/api/reset/anselmo@opa.eu?clean=full"

  @login = LoginPage.new
  @tasks = TasksPage.new
  @profile = ProfilePage.new

  page.current_window.resize_to(1280, 800)
end

Before('@auth') do
  @login.load
  @login.do_login('login@opa.eu', '123456')
end

After('@logout') do
  @tasks.navbar.bye
end

After('@profile_logout') do
  @profile.navbar.bye
end

After do |scenario|
  scenario_name = scenario.name.downcase.tr(' ', '_')
  scenario_name.gsub!(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
  screenshot = "logs/screenshots/#{scenario_name}.png"
  page.save_screenshot(screenshot)
  embed(screenshot, 'image/png', 'Click to view the evidence...')
end

