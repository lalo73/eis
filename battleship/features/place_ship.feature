Feature: Place a Ship
  Scenario: I place my ship successfully
    Given an empty board
    When I place a destructor in A1 horizontally
    Then my ship is in the board at A1

  Scenario: I can't place my ship in a taken position
    Given a board with a destructor in A1
    When I try to place my desctructor in A1
    Then my ship is not in the board at A1

  Scenario: I can't place my ship outsite the board
    Given a board of size 4x4
    When I try to place my desctructor in A5
    Then my ship is not in the board
    
