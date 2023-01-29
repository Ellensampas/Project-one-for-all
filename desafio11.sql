SELECT M.titulo AS nome_musica,
CASE 
	WHEN M.titulo LIKE '%Bard%' THEN REPLACE(M.titulo, 'Bard', 'QA')
    WHEN M.titulo LIKE '%Amar%' THEN REPLACE(M.titulo, 'Amar', 'Code Review')
    WHEN M.titulo LIKE '%Pais' THEN REPLACE(M.titulo, 'Pais', 'Pull Requests')
    WHEN M.titulo LIKE '%SOUL' THEN REPLACE(M.titulo, 'SOUL', 'CODE')
    WHEN M.titulo LIKE '%SUPERSTAR' THEN REPLACE(M.titulo, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
FROM SpotifyClone.musicas AS M
WHERE
(M.titulo LIKE '%Bard%' OR
M.titulo LIKE '%Amar%' OR
M.titulo LIKE '%Pais' OR
M.titulo LIKE '%SOUL%' OR
M.titulo LIKE '%SUPERSTAR%')
ORDER BY M.titulo DESC;