Feature: Login
  Para que somente eu possa ver as minhas tarefas
  Sendo um usuário
  Posso logar no sistema com meus dados de acesso previamente cadastrados
    
  @login @logout
  Scenario: User login
    When faco login com "login@opa.eu" e "123456"
    Then sou autenticado com sucesso
    And vejo o meu painel de atividades
  
  @login_exp
  Scenario Outline: Login attempt
    When faco login com "<email>" e "<password>"
    Then devo ver a mensagem "<alert>"
    
    Examples:
      | email              | password | alert                       |
      | login@opa.eu       | abc123   | Senha inválida.             |
      | chulapa@hu3mail.eu | 123456   | Usuário não cadastrado.     |
      | login@opa.eu       |          | Senha ausente.              |
      |                    | 123456   | Email incorreto ou ausente. |