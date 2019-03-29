USE practica1bda;

-- Ejercicio 5
-- Update: Actualizar el resultado del partido de código '2012020053' ya que el partido terminó realmente 5 a 3 en
-- vez de 6 a 4 como figura. Comentar problemas y anomalías si las hay.

SET AUTOCOMMIT = 0;
BEGIN WORK;

UPDATE segundatabla
SET home_goals = '5', away_goals = '3', tgoals = '5'
WHERE game_id = '2012020053' AND
	  tgoals = '6';
      
UPDATE segundatabla
SET home_goals = '5', away_goals = '3', tgoals = '3'
WHERE game_id = '2012020053' AND
	  tgoals = '4';
      
SELECT *
FROM segundatabla
WHERE game_id = '2012020053';

ROLLBACK;