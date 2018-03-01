Feature: Register tasks 
  In order to organize my tasks
  As a user
  I want to register new tasks

  @new_task @auth
  Scenario: New task
    Given I have a new task with:
      | title | Read a Ruby book |
      | date  | 31/03/2018       |
    And I want to tag this task with:
      | tag   |
      | ruby  |
      | book  |
      | read  |
      | study |
    When I register this task
    Then I see this task registered with status "Em andamento"
  
  

  