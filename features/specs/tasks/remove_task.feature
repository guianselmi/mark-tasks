Feature: Remove tasks
  In order to organize my taks
  As a registered user
  I want to remove an unwanted task

  @auth @remove @logout @smoke
  Scenario: Remove an unwanted task
    Given I have a registered task
    When I request the removal of this task
    And confirm this request
    Then this task should not be displayed on the list

  @auth @give_up @logout
  Scenario: Give up removing the task
    Given I have a registered task
    When I request the removal of this task
    And cancel this request
    Then this task should still be displayed on the list

  @auth @remove_all @logout
  # Doing for fun the Scenario below. That's why it's incomplete, but WORKING :D
  Scenario: Remove all tasks
    Given I want to remove all tasks
  