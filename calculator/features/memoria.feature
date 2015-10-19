Feature: memoria de cantidad de operaciones
  Scenario: no hice operaciones
    When no hice operaciones
    Then la cantidad de operaciones es 0

  Scenario: cuando hago operaciones la cantidad de incrementa
    When hago una suma
    And hago una resta
    Then la cantidad de operaciones es 2

  Scenario: cuando reseteo la cantidad de operaciones vuelve a cero
    When hago una suma
    And hago una resta
    And reseteo la memoria
    Then la cantidad de operaciones es 0

  Scenario: al sumar aumenta la cantidad de operaciones en 1
    When hago una suma
    Then la cantidad de operaciones es 1

  @wip
  Scenario: al restar aumenta la cantidad de operaciones en 1
    When hago una resta
    Then la cantidad de operaciones es 1

  @wip
  Scenario: al calcular el promedio la cantidad de operaciones es 1
    When hago un promedio
    Then la cantidad de operaciones es 1

