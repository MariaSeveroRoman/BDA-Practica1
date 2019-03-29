USE practica1bda;

-- Ejercicio 12
-- Update 2: A partir de febrero de 2013, el equipo denominado “Wild” pasa a denominarse “Wild Side”. 
-- Reflejar este hecho en las tablas, explicando problemas y anomalías. 
-- Comentar si surge algún problema entre datos en las tablas y las dependencias funcionales.

SET AUTOCOMMIT = 0;
BEGIN WORK;

UPDATE equipo e
	INNER JOIN jugadaequipo je ON e.team_id = je.team_id
	INNER JOIN partido p ON je.game_id = p.game_id
SET teamName = 'Wild Side'
WHERE teamName = 'Wild' AND
	  YEAR(date_time) = '2013' AND
	  MONTH(date_time) >= '02';
      
SELECT *
FROM equipo
WHERE teamName = 'Wild Side';

ROLLBACK;

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
