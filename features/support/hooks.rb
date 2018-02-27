Before do
  visit "https://marktasks.herokuapp.com/api/reset/anselmo@opa.eu?clean=full"
end

After('@logout') do
  find('a[href="/user_settings dropdown-toggle"]').click
  find('a[href$=logout]').click
end

#2h26m