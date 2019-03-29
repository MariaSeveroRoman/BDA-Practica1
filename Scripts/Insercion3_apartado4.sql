USE practica1bda;

-- Ejercicio 4
-- Insercion 3: Los datos de un nuevo equipo, denominado “Lasters” y cuyo código será 99.

SET AUTOCOMMIT = 0;
BEGIN WORK;

INSERT INTO segundatabla (team_id, teamName)
VALUES ('99', 'Lasters');

SELECT *
FROM segundatabla
WHERE team_id = 99;

ROLLBACK WORK;