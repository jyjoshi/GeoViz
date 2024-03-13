-- CREATE extension postgis;
-- CREATE extension postgis_topology;


-- Convex Hull
SELECT ST_AsText(ST_ConvexHull(
    ST_Collect(
            ST_GeomFromText(
                    'MULTIPOINT(-118.281238 34.030247,-118.290687 34.020293,-118.286021 34.020395,-118.2850829 34.0252069,-118.285312 34.020315,-118.28573 34.01909,-118.28954 34.02077,-118.28412 34.02448,-118.28598 34.02220,-118.28217 34.02114,-118.2832101 34.0213864,-118.2840047 34.0203658,-118.2888554 34.0196046)')
            )) );

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    geom GEOMETRY(Point, 4326)
);

INSERT INTO locations (name, geom)
VALUES ('Home', ST_SetSRID(ST_MakePoint(-118.281238, 34.030247), 4326)),
       ('Gerontology Fountain', ST_SetSRID(ST_MakePoint(-118.290687, 34.020293), 4326)),
       ('RTH Fountain', ST_SetSRID(ST_MakePoint(-118.286021, 34.020395), 4326)),
       ('Village Fountain', ST_SetSRID(ST_MakePoint(-118.2850829, 34.0252069), 4326)),
       ('Dornsife School', ST_SetSRID(ST_MakePoint(-118.285312, 34.020315), 4326)),
       ('Marshall School', ST_SetSRID(ST_MakePoint(-118.28573, 34.01909), 4326)),
       ('Viterbi Engg', ST_SetSRID(ST_MakePoint(-118.28954, 34.02077), 4326)),
       ('Rock N Reileys', ST_SetSRID(ST_MakePoint(-118.28412, 34.02448), 4326)),
       ('Annenberg Cafe', ST_SetSRID(ST_MakePoint(-118.28598, 34.02220), 4326)),
       ('Starbucks', ST_SetSRID(ST_MakePoint(-118.28217, 34.02114), 4326)),
       ('Leavey Library', ST_SetSRID(ST_MakePoint(-118.2832101, 34.0213864), 4326)),
       ('Doheny Library', ST_SetSRID(ST_MakePoint(-118.2840047, 34.0203658), 4326)),
       ('Seaver Library', ST_SetSRID(ST_MakePoint(-118.2888554, 34.0196046), 4326));

-- KNN
SELECT id, name,
  ST_Transform(locations.geom, 4326),
  locations.geom <-> 'SRID=4326;POINT(-118.281238 34.030247)'::geometry AS dist
FROM
  locations
where name != 'Home'
ORDER BY
  dist
LIMIT 4;
