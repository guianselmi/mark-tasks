When('faco login com {string} e {string}') do |email, password|
  visit 'https://marktasks.herokuapp.com'

  @email = email

  find('input[placeholder="example@gmail.com"]').set email
  find('input[type=password]').set password
  find('button[id*=btnLogin]').click
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
  login_alert = find('.alert-login')
  expect(login_alert.text).to eql alert_message
end
