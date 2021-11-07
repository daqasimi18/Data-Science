/* A */
SELECT name 
FROM ExecutiveStar
WHERE gender = 'f';

/* B */
SELECT RichExec.name
FROM RichExec, StudioPres
WHERE RichExec.name = StudioPres.name;

/* C */
SELECT ExecutiveStar.name 
FROM ExecutiveStar, StudioPres, RichExec
WHERE ExecutiveStar.networth >= 50000000 AND StudioPres.cert = RichExec.cert;

