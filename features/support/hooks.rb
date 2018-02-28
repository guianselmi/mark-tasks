Before do
  visit "https://marktasks.herokuapp.com/api/reset/anselmo@opa.eu?clean=full"

  @login = LoginPage.new
  @navbar = Navbar.new
  @tasks = TasksPage.new
  @profile = ProfilePage.new
end

After('@logout') do
  @navbar.user_menu.click
  @navbar.logout.click
end

#2h26m