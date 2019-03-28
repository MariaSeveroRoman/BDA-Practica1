USE practica1bda;

INSERT INTO Jugador
SELECT DISTINCT player_id, firstName, lastName, nationality
FROM primeratabla;

INSERT INTO Fecha
SELECT DISTINCT date_time, season
FROM primeratabla
UNION
SELECT DISTINCT date_time, season
FROM segundatabla;

INSERT INTO Equipo
SELECT DISTINCT team_id, teamName
FROM segundatabla;

INSERT INTO Partido
SELECT DISTINCT game_id, home_team_id, away_team_id, home_goals, away_goals, date_time
FROM primeratabla
UNION
SELECT DISTINCT game_id, home_team_id, away_team_id, home_goals, away_goals, date_time
FROM segundatabla;

INSERT INTO JugadaEquipo
SELECT DISTINCT game_id, team_id, tgoals, tshots, thits
FROM segundatabla;

INSERT INTO Jugadas
SELECT DISTINCT play_id, team_id_for, team_id_against, event, game_id
FROM primeratabla;

INSERT INTO JugadaJugador
SELECT DISTINCT game_id, player_id, assists, goals, shots
FROM primeratabla;
