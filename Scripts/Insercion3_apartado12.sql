USE practica1bda;

-- Ejercicio 12
-- 3: Los datos de un nuevo equipo, denominado “Lasters” y cuyo código será 99. 

SET AUTOCOMMIT = 0;
BEGIN WORK;

INSERT INTO equipo (team_id, teamName)
VALUES ('99', 'Lasters');


SELECT *
FROM equipo
WHERE team_id = '99';

ROLLBACK WORK;