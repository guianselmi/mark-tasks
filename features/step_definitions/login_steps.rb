Quando('faco login com {string} e {string}') do |email, senha|
  visit 'https://marktasks.herokuapp.com'

  find('input[placeholder="example@gmail.com"]').set email
  find('input[type=password]').set senha
  find('button[id*=btnLogin]').click

  sleep 5
end

Entao('sou autenticado com sucesso') do
  user_menu = find('a[href="/user_settings dropdown-toggle"]')
  expect(user_menu).to eq email
end

Entao('vejo as minhas tarefas') do
  pending # Write code here that turns the phrase above into concrete actions
end

Entao('devo ver a mensagem {string}') do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end
