USE practica1bda;

-- Ejercicio 12
-- Insercion 2. El partido de código 2012030999 entre los “Red Wings” (locales) y los “Penguins” que terminó 3 a 2 a favor de los locales. 

SET AUTOCOMMIT = 0;
BEGIN WORK;

INSERT INTO partido (game_id, home_team_id, away_team_id,home_goals,away_goals)
VALUES ('2012030999', (SELECT DISTINCT team_id
								FROM equipo e 
								WHERE e.teamName = 'Red Wings'),
													          (SELECT DISTINCT team_id
																FROM equipo e 
																WHERE e.teamName = 'Penguins'),'3', '2');
                                                                
SELECT *
FROM partido
WHERE game_id = '2012030999';

ROLLBACK WORK;