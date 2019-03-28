USE practica1bda;
SET AUTOCOMMIT = 0;

BEGIN WORK;
/*A partir de febrero de 2013, el equipo denominado “Wild” pasa a denominarse “Wild Side”. Reflejar este
hecho en las tablas, explicando problemas y anomalías. Comentar si surge algún problema entre datos en
las tablas y las dependencias funcionales*/

UPDATE segundatabla
SET teamName = 'Wild Side'
WHERE teamName = 'Wild' AND
	  YEAR(date_time) = '2013' AND
	  MONTH(date_time) >= '02';
      
SELECT *
FROM segundatabla
WHERE teamName = 'Wild';

ROLLBACK;