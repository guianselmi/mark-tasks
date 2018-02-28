Before do
  visit "https://marktasks.herokuapp.com/api/reset/anselmo@opa.eu?clean=full"

  @login = LoginPage.new
  @tasks = TasksPage.new
  @profile = ProfilePage.new
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

#3h54m