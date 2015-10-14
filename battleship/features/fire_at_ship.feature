Feature: Fire at a ship
  Scenario: I fire and hits the water
    Given an empty board
    When I fire at an empty position A1
    Then it hits the water

  @wip
  Scenario: I fire and hits a ship
    Given a board with a destructor in A1
    When I fire at A1 position
    Then it hits the ship

  @wip
  Scenario: I fire and sink a ship
    Given a board with an almost sunk destructor in A1
    When I fire at A3 position
    Then the ship is sunk

#* Como usuario quiero disparar a los barcos enemigos
#Escenario 1: Disparo y toco agua
#Escenario 2: Disparo y toco un barco pero no lo hundo
#Escenario 3: Disparo y toco un barco y lo hundo
