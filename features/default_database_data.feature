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
    And the country should be Spain
    And I should have 1 zone
    And the zone should be EU_VAT
    And I should have 2 states
    And the states should be Barcelona and Gerona
    And I should have 3 tax categories
    And the tax categories should be General, Reducido and SuperReducido
    And I should have 3 tax rates
    And the tax rates should be IVA General, IVA Reducido and IVA Super Reducido
    And I should have 2 shipping category
    And the shipping category should be Ecocity a domicilio
