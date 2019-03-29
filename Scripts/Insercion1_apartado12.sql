USE practica1bda;

-- Ejercicio 12
-- Insercion 1: Los datos del nuevo jugador que se llama Samuel Smithson y es canadiense (CAN) y al que se le ha asignado el identificador 5554441.  

SET AUTOCOMMIT = 0;
BEGIN WORK;

INSERT INTO jugador(player_id, firstName, lastName, nationality)
VALUES ('5554441', 'Samuel', 'Smithson', 'CAN');

SELECT *
FROM jugador
WHERE player_id = '5554441';

ROLLBACK WORK;
																						

