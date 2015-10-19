Feature: Operaciones basicas

  Background:
    Given voy a la pagina de la calculadora

  Scenario: suma
    Given un operando es 1
    And otro operando es 2
    When los sumo
    Then el resultado es 3

  @wip
  Scenario: resta
    Given un operando es 3
    And otro operando es 1
    When los resto
    Then el resultado es 2

  @wip
  Scenario: promedio
    Given un operando es 10
    And otro operando es 2
    When los promedio
    Then el resultado es 6
