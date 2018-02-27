When('faco login com {string} e {string}') do |email, password|
  @email = email

  @login = LoginPage.new
  @login.load
  @login.do_login(email, password)
end

Then('sou autenticado com sucesso') do
  user_menu = find('a[href="/user_settings dropdown-toggle"]')
  expect(user_menu.text).to eql @email
end

Then('vejo o meu painel de atividades') do
  page_title = find('.header-title h3')
  expect(page_title.text).to eql 'Painel de Atividades'
end

Then('devo ver a mensagem {string}') do |alert_message|
  expect(@login.alert.text).to eql alert_message
end
