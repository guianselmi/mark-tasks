Dado("que eu acessei a pagina de cadastro") do
  visit 'https://marktasks.herokuapp.com/register'
  expect(page).to have_content 'Criar uma conta Mark7'
end
  
Dado("possuo os seguintes dados:") do |table|
  @cadastro = table.rows_hash
end

Quando("faco o cadastro") do
  fill_in 'register_name', with: @cadastro['Nome']
  fill_in 'register_email', with: @cadastro['Email']
  # fill_in 'register_password', with: @cadastro['Senha']
  find('input[type=password]').set @cadastro['Senha']

  # click_button 'Cadastrar'
  find('button[type=submit]').click
end

Entao("sou redirecionado para o painel de tarefas") do
  expect(page).to have_content 'Todas as minhas tarefas'
end

Entao("devo ver uma mensagem de alerta {string}") do |mensagem_alerta|
  expect(page).to have_content mensagem_alerta
  sleep 5
end                                                                          