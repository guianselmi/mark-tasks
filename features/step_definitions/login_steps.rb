Quando('faco login com {string} e {string}') do |email, senha|
  visit 'https://marktasks.herokuapp.com'

  @email = email

  find('input[placeholder="example@gmail.com"]').set email
  find('input[type=password]').set senha
  find('button[id*=btnLogin]').click
end

Entao('sou autenticado com sucesso') do
  user_menu = find('a[href="/user_settings dropdown-toggle"]')
  expect(user_menu.text).to eql @email
end

Entao('vejo o meu painel de atividades') do
  titulo_pagina = find('.header-title h3')
  expect(titulo_pagina.text).to eql 'Painel de Atividades'
end

Entao('devo ver a mensagem {string}') do |mensagem_alerta|
  alerta_login = find('.alert-login')
  expect(alerta_login.text).to eql mensagem_alerta
end
