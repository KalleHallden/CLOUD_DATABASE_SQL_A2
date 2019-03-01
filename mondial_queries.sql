

/*

SQL1:
SELECT *
FROM island
WHERE type='volcanic'

SQL2:
SELECT name AS n, latitude AS la, longitude AS lo 
FROM airport

SQL3:
SELECT name
FROM island
WHERE islands='Inner Hebrides' OR islands='Outer Hebrides' OR islands='New Hebrides'

SQL4:
SELECT DISTINCT desert, country FROM geo_desert 

SQL5:
SELECT C.code, C.name
FROM country AS C, ismember AS I
WHERE C.code = I.country
AND I.organization = 'G-24'
AND EXISTS (
   SELECT *
   FROM encompasses AS E
   WHERE E.continent = 'Asia'
   AND C.code = E.country
)

SQL6:
SELECT DISTINCT C.name 
FROM country AS C, language AS L 
WHERE L.country = C.code AND L.percentage >= 0.5

SQL7:
(SELECT L.name AS name FROM lake AS L)
UNION
(SELECT R.name AS name FROM river AS R)
UNION
(SELECT S.name AS name FROM sea AS S)
ORDER BY name ASC;

SQL8:
SELECT AVG(population.infant_mortality) AS avg_inf_mort from population

SQL9:
SELECT CO.name, AVG(EC.GDP)
FROM continent AS CO,
(economy AS EC JOIN encompasses AS E ON CO.name = E.continent AND E.country = EC.country)

SQL10:
SELECT I.name, ISNULL(L.name, 'NULL')
FROM ISLAND AS I, LAKEONISLAND AS L
WHERE I.name = L.island

SQL11:
SELECT C.name
FROM country AS C, borders AS B
WHERE B.country1 = C.code OR B.country2 = C.code
AND B.length > 100

SQL12:
SELECT DISTINCT C.name
FROM country AS C, language AS L, encompasses AS E
WHERE C.code = E.country
AND E.continent = 'Asia'
AND L.name != 'English'
AND L.percentage >= 0.5

 */