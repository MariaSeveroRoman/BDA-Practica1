USE practica1bda;

-- Ejercicio 4
-- Insercion 2. El partido de código 2012030999 entre los “Red Wings” (locales) y los “Penguins” que terminó 3 a 2 a favor de los locales. 

SET AUTOCOMMIT = 0;
BEGIN WORK;

INSERT INTO segundatabla (game_id, home_team_id, away_team_id,home_goals,away_goals,team_id,teamName,tgoals)
VALUES ('2012030999', (SELECT DISTINCT team_id
								FROM segundatabla s 
								WHERE s.teamName = 'Red Wings'),
													          (SELECT DISTINCT team_id
																FROM segundatabla s 
																WHERE s.teamName = 'Penguins'),'3', '2', 
																										(SELECT DISTINCT team_id
																										  FROM segundatabla  s
																										  WHERE s.teamName = 'Red Wings'), 'Red Wings', '3');


INSERT INTO segundatabla (game_id, home_team_id, away_team_id,home_goals,away_goals,team_id,teamName,tgoals)
VALUES ('2012030999', (SELECT DISTINCT team_id
								FROM segundatabla s 
								WHERE s.teamName = 'Red Wings'),
													          (SELECT DISTINCT team_id
																FROM segundatabla s  
																WHERE s.teamName = 'Penguins'),'3', '2', 
																										(SELECT DISTINCT team_id
																										  FROM segundatabla s 
																										  WHERE s.teamName = 'Penguins'), 'Red Wings', '2');
																									
SELECT *
FROM practica1bda.segundatabla
WHERE game_id = '2012030999';

ROLLBACK WORK;