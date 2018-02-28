class Navbar < SitePrism::Section
  element :user_menu, 'a[href="/user_settings dropdown-toggle"]'
  element :my_profile, '#navbar a[href="/user_settings"]'
  element :logout, 'a[href$=logout]'

  def bye
    user_menu.click
    logout.click
  end
end