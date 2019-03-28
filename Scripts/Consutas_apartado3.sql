USE practica1bda;

/*Consulta 1: ¿Cuántos partidos ha jugado en el año 2013 el equipo de nombre Blackhawks?*/

SELECT COUNT(*) numeroPartidos
FROM segundatabla s
WHERE s.teamName = 'Blackhawks' AND
	  year(s.date_time) = '2013';
      
/*Consulta 2: Por cada partido registrado en el mes de enero de 2013, mostrar el nombre de los equipos locales*/

SELECT teamName equiposLocales
FROM segundatabla s
WHERE month(s.date_time) = '01' AND
	  year(s.date_time) = '2013' AND
	  s.home_team_id = s.team_id;
      

/*Consulta 3: Por cada equipo, mostrar su identificador, nombre, y estadísticas (tgoals, tshots y thits) en los
partidos jugados en 2013 como equipos locales*/  

SELECT team_id IdentificadorEquipo, teamName nombreEquipo, tgoals Goles, tshots Tiros, thits Golpes
FROM segundatabla s
WHERE year(s.date_time) = '2013' AND
	  s.home_team_id = s.team_id;
      

/*Consulta 4: Obtener, para cada partido que haya jugado el o los equipo(s) en los que haya jugado el jugador
Adam McQuaid, el identificador del equipo, el nombre del equipo, el año, mes y día del partido y
el identificador de cada jugada realizada junto con su descripción (event) para cada una de las
jugadas que haya realizado el equipo en cada partido (event) ordenadas por la fecha del partido*/

SELECT team_id IdentificadorEquipo, teamName nombreEquipo, year(p.date_time), month(p.date_time), day(p.date_time), play_id IdentificadorJugada, event Descripcion 
FROM primeratabla p INNER JOIN segundatabla s ON p.game_id = s.game_id
WHERE p.firstName = 'Adam' and	
	  p.lastName = 'McQuaid'
ORDER BY(p.date_time);
