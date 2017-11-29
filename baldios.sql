SELECT p.gid, p.geom, p.clavegdl, sum(st_area(st_intersection(c.geom, p.geom)) * c.nivel) AS sup_cons, (sum(st_area(st_intersection(c.geom, p.geom)) * c.nivel)/st_area(p.geom))*100 AS porcentaje
FROM catastro.predios_utm_13n AS p INNER JOIN catastro.construcciones AS c ON st_intersects(c.geom, p.geom)
GROUP BY p.gid
HAVING (sum(st_area(st_intersection(c.geom, p.geom)) * c.nivel)/st_area(p.geom))*100 <= 25
