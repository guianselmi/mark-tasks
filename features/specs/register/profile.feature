Feature: My Profile
  In order to have my own data updated
  As a user
  I want to complete my register

  @profile @logout
  Scenario Outline: Update my profile
    Given I'm authenticated with "login@opa.eu" and "123456"
    And I access my profile
    When I complete my register with "<company>" and "<role>"
    Then I see the message "Perfil atualizado com sucesso."

    Examples:
      | company    | role       |
      | QA Ninja   | Developer  |
      | TFG Co     | QA         |
      | Microsoft  | CTO        |
      | Google     | Estagiário |
      | Jojo Ramen | CEO        |

  