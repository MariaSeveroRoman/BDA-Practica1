USE practica1bda;

-- Ejercicio 1

ALTER TABLE primeratabla
ADD PRIMARY KEY (player_id,play_id);

ALTER TABLE segundatabla
ADD PRIMARY KEY (game_id,team_id);