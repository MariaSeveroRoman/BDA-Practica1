USE  practica1bda;

-- Ejercicio 10
-- Creacion de tablas normalizadas

DROP TABLE IF EXISTS `JugadaJugador`;
DROP TABLE IF EXISTS `Jugadas`;
DROP TABLE IF EXISTS `JugadaEquipo`;
DROP TABLE IF EXISTS `Partido`;
DROP TABLE IF EXISTS `Equipo`;
DROP TABLE IF EXISTS `Fecha`;
DROP TABLE IF EXISTS `Jugador`;

-- Jugador

CREATE TABLE `Jugador` (
	`player_id` int,
    `firstName` varchar(25),
    `lastName` varchar(25),
    `nationality` varchar(25),
    CONSTRAINT pk_jugador PRIMARY KEY (player_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- fecha 

CREATE TABLE `Fecha` (
	`date_time` datetime,
    `season` int,
    CONSTRAINT pk_fecha PRIMARY KEY (date_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Equipo

CREATE TABLE `Equipo` (
	`team_id` int,
    `teamName` varchar(25),
    CONSTRAINT pk_equipo PRIMARY KEY (team_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Partido

CREATE TABLE `Partido` (
	`game_id` int,
    `home_team_id` int,
    `away_team_id` int,
    `home_goals` int,
    `away_goals` int,
    `date_time` datetime,
    CONSTRAINT pk_partido PRIMARY KEY (game_id),
	CONSTRAINT fk_date_time_Partido FOREIGN KEY (date_time) REFERENCES Fecha(date_time)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- JugadaEquipo

CREATE TABLE `JugadaEquipo` (
	`game_id` int,
	`team_id` int,
    `tgoals` int,
    `tshots` int,
    `thits` int,
    CONSTRAINT pk_JugadaEquipo PRIMARY KEY (game_id,team_id),
	CONSTRAINT fk_game_id_JugadaEquipo FOREIGN KEY (game_id) REFERENCES Partido(game_id),
	CONSTRAINT fk_team_id_JugadaEquipo FOREIGN KEY (team_id) REFERENCES Equipo(team_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Jugadas

CREATE TABLE `Jugadas` (
	`play_id` varchar(25),
	`team_id_for` int,
    `team_id_against` int,
    `event` varchar(25),
    `game_id` int,
    CONSTRAINT pk_Jugadas PRIMARY KEY (play_id),
    CONSTRAINT fk_game_id_Jugadas FOREIGN KEY (game_id) REFERENCES Partido(game_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- JugadaJugador

CREATE TABLE `JugadaJugador` (
	`game_id` int,
	`player_id` int,
    `assists` int,
    `goals` int,
    `shots` int,
    CONSTRAINT pk_JugadaJugador PRIMARY KEY (game_id,player_id),
	CONSTRAINT fk_game_id_JugadaJugador FOREIGN KEY (game_id) REFERENCES Partido(game_id),
	CONSTRAINT fk_team_id_JugadaJugador FOREIGN KEY (player_id) REFERENCES Jugador(player_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;