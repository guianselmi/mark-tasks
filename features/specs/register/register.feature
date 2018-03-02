Feature: Register
  In order to be able to control and manage my tasks
  As a user who needs this kind of control
  I want to register with my personal info

	Scenario: Simple register
		Given I accessed the registration page
		And I have the following info:
			| Name     | Anselmo        |
			| Email    | anselmo@opa.eu |
			| Password | 123456         |
		When I register
		Then I'm redirected to the task panel
	
	Scenario Outline: Register attempt
		Given I accessed the registration page
		And I have the following info:
			| Name     | <name>     |
			| Email    | <email>    |
			| Password | <password> |
		When I register
		Then I should see the alert message "<alert>"

		Examples:
			| name    | email          | password | alert                                       |
			| Anselmo | anselmo@opa.eu |          | Informe uma senha.                          |
			| Anselmo | anselmo@opa.eu | 1        | Sua senha deve ter pelo menos 6 caracteres. |
			| Anselmo | anselmo@opa.eu | 12345    | Sua senha deve ter pelo menos 6 caracteres. |
			| Anselmo |                | 123456   | Email é obrigatório.                        |