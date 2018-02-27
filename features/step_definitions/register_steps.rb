Given("que eu acessei a pagina de cadastro") do
  visit 'https://marktasks.herokuapp.com/register'
  expect(page).to have_content 'Criar uma conta Mark7'
end

Given("possuo os seguintes dados:") do |table|
  @register = table.rows_hash
end

When("faco o cadastro") do
  fill_in 'register_name', with: @register['Name']
  fill_in 'register_email', with: @register['Email']
  # fill_in 'register_password', with: @register['Senha']
  find('input[type=password]').set @register['Password']

  # click_button 'Cadastrar'
  find('button[type=submit]').click
end

Then("sou redirecionado para o painel de tarefas") do
  expect(page).to have_content 'Todas as minhas tarefas'
end

Then("devo ver uma mensagem de alerta {string}") do |alert_message|
  expect(page).to have_content alert_message
end