USE practica1bda;
SET AUTOCOMMIT = 0;

BEGIN WORK;

/* 3º INSERCION: Los datos de un nuevo equipo, denominado “Lasters” y cuyo código será 99*/

INSERT INTO segundatabla (team_id, teamName)
VALUES ('99', 'Lasters');

SELECT *
FROM segundatabla
WHERE team_id = 99;

ROLLBACK WORK;