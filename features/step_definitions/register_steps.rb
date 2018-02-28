Given("que eu acessei a pagina de cadastro") do
  visit 'https://marktasks.herokuapp.com/register'
end

Given("possuo os seguintes dados:") do |table|
  @register = table.rows_hash
end

When("faco o cadastro") do
  # fill_in só funciona pra ID e Names
  fill_in 'register_name', with: @register['Name']
  fill_in 'register_email', with: @register['Email']
  find('input[type=password]').set @register['Password']

  find('button[type=submit]').click
end

Then("sou redirecionado para o painel de tarefas") do
  expect(page).to have_content 'Todas as minhas tarefas'
end

Then("devo ver uma mensagem de alerta {string}") do |alert_message|
  expect(page).to have_content alert_message
end