Feature: Default Taxonomies
  In order to have a store for Ecocity
  As a user
  I want to have some taxonomies created by default

  Scenario: Go to home page and check 2 existing taxonomies
    Given We visit the home page
    When page is loaded
    Then I should have 2 taxonomies
    #And I should have 8 taxons