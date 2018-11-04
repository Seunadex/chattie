Feature: Welcome Page


   In order to sign up
   As an unauthenticated user
   I want to see the welcome page

   Scenario: unauthenticated user sees the welcome page
    Given I am not authenticated
    When I go to the welcome page
    Then I must see the welcome's page content
