CREATE TABLE osmgdl.ways_join AS
SELECT ways.*, buffer.id, buffer.nombre, buffer.categoria, buffer.tipo, buffer.sentido, buffer.velocidad
FROM osmgdl.ways
LEFT JOIN osmgdl.buffer ON ST_Intersects(ways.the_geom, buffer.geom)
