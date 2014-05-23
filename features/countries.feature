Feature: Default countries
  In order to have a store for Ecocity
  As a user
  I want to have only one country available that is Spain

  @javascript
  Scenario: Check that by default I only have Spain available
    Given We visit the home page
    When page is loaded
    Then I should have 1 country available
    And it should be Spain