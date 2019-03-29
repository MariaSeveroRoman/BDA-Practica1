USE practica1bda;

-- Ejercicio 12
-- Consulta 1: ¿Cuántos partidos ha jugado en el año 2013 el equipo de nombre Blackhawks? 

SELECT COUNT(DISTINCT p.game_id) numeroPartidos
FROM partido p 
     INNER JOIN jugadaequipo je ON p.game_id = je.game_id
     INNER JOIN equipo e ON e.team_id = je.team_id
WHERE year(p.date_time) = '2013' AND
	  e.teamName = 'Blackhawks';
      
-- Consulta 2: Por cada partido registrado en el mes de enero de 2013, mostrar el nombre de los equipos locales. 

SELECT teamName equiposLocales
FROM equipo e
	 INNER JOIN jugadaequipo je ON e.team_id = je.team_id
     INNER JOIN partido p ON p.game_id = je.game_id
WHERE month(p.date_time) = '01' AND
	  year(p.date_time) = '2013' AND
      p.home_team_id = e.team_id;

-- Consulta 3: Por cada equipo, mostrar su identificador, nombre, y estadísticas (tgoals, tshots y thits) en los partidos jugados en 2013 como equipos locales. 

SELECT e.team_id Identificadorequipo, teamName nombreEquipo, tgoals Goles, tshots Tiros, thits Golpes  
FROM jugadaequipo je
	 INNER JOIN equipo e ON je.team_id = e.team_id
     INNER JOIN partido p ON je.game_id = p.game_id
WHERE year(p.date_time) = '2013' AND
      p.home_team_id = e.team_id;
      
-- Consulta 4: Obtener, para cada partido que haya jugado el o los equipo(s) en los que haya jugado el jugador Adam McQuaid, 
-- el identificador del equipo, el nombre del equipo, el año, mes y día del partido y el identificador de cada jugada realizada 
-- junto con su descripción (event) para cada una de las jugadas que haya realizado el equipo en cada partido (event) 
-- ordenadas por la fecha del partido.

SELECT DISTINCT E.team_id IdentificadorEquipo, teamName nombreEquipo, year(p.date_time), month(p.date_time), day(p.date_time), play_id IdentificadorJugada, event Descripcion
FROM jugador j
	 INNER JOIN jugadajugador jj ON j.player_id = jj.player_id
     INNER JOIN partido p ON jj.game_id = p.game_id
     INNER JOIN jugadas jug ON p.game_id = jug.game_id
     INNER JOIN jugadaequipo je ON p.game_id = je.game_id
     INNER JOIN equipo e ON je.team_id = e.team_id
WHERE j.firstName = 'Adam' and	
	  j.lastName = 'McQuaid'
ORDER BY(p.date_time);








