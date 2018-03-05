Feature: My photo
  In order to have my personal photo on my profile
  As a user
  I want to upload my photo

  @auth @photo @logout
  Scenario: Upload my photo
    Given I have a photo to upload
    And I access my profile
    When I upload my photo
    Then I should see the upload message "Agora seu perfil está bem legal."
  
  

  