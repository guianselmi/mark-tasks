Feature: Register
  In order to be able to control and manage my tasks
  As a user who needs this kind of control
  I want to register with my personal info

	Scenario: Simple register
		Given que eu acessei a pagina de cadastro
		And possuo os seguintes dados:
			| Name     | Anselmo        |
			| Email    | anselmo@opa.eu |
			| Password | 123456         |
		When faco o cadastro
		Then sou redirecionado para o painel de tarefas
	
	Scenario Outline: Register attempt
		Given que eu acessei a pagina de cadastro
		And possuo os seguintes dados:
			| Name     | <name>     |
			| Email    | <email>    |
			| Password | <password> |
		When faco o cadastro
		Then devo ver uma mensagem de alerta "<alert>"

		Examples:
			| name    | email          | password | alert                                       |
			| Anselmo | anselmo@opa.eu |          | Informe uma senha.                          |
			| Anselmo | anselmo@opa.eu | 1        | Sua senha deve ter pelo menos 6 caracteres. |
			| Anselmo | anselmo@opa.eu | 12345    | Sua senha deve ter pelo menos 6 caracteres. |
			| Anselmo |                | 123456   | Email é obrigatório.                        |