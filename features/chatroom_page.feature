Feature: Chatroom Page

  In order to send messages
  As an authenticated user
  I want to see messages in a chatroom

  Scenario: authenticated user sends a message in a chatroom
    Given I am an authenticated user
    And there is a public chatroom
    When I go a public chatroom
    Then I must see the name of the chatroom
    And I must see my username
    And I must see direct messages