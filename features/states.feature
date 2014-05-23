Feature: Default states
  In order to have a store for Ecocity
  As a user
  I want to have only 2 states available that are Barcelona and Girona

  @javascript
  Scenario: Check that by default I only have Barcelona and Girona available
    Given We visit the home page
    When page is loaded
    Then I should have 2 states available
    And they should be Barcelona and Girona