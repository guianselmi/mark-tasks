Feature: Login
  So that only I can see my tasks
  As a user
  I want to log into the system with my access info previously registered
    
  @login @logout @smoke
  Scenario: User login
    When I log in with "login@opa.eu" and "123456"
    Then I'm authenticated successfully
    And I see my task panel
  
  @login_exp
  Scenario Outline: Login attempt
    When I log in with "<email>" and "<password>"
    Then I'm not authenticated
    And I should see the message "<alert>"
    
    Examples:
      | email              | password | alert                       |
      | login@opa.eu       | abc123   | Senha inválida.             |
      | chulapa@hu3mail.eu | 123456   | Usuário não cadastrado.     |
      | login@opa.eu       |          | Senha ausente.              |
      |                    | 123456   | Email incorreto ou ausente. |