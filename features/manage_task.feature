Feature: Add courses to school
    As an User
    I want to create todo list
    So that i can manage my work

Background:
    Given I should at todo list page

Scenario: create task 
    When I fill text "write e2e"
    And I click create button
    Then I shoud see "write e2e" content
 