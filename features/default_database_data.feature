Feature: Default Taxonomies
  In order to have a store for Ecocity
  As a user
  I want to have some taxonomies created by default

  @javascript
  Scenario: Go to home page and check my default data
    Given We visit the home page
    When page is loaded
    Then I should have 2 taxonomies
    And I should have 11 taxons
    And I should have 1 country
    And I should have 1 zone
    And I should have 2 states
    And the zone should be EU_VAT
    And the country should be Spain
    And the states should be Barcelona and Gerona