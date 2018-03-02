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

#v4 2h17m