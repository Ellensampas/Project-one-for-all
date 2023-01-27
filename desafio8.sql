SELECT 
	A.nome_artista AS artista,
	AL.nome_album AS album
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album AS AL ON A.artista_id = AL.artista_id
WHERE A.nome_artista = 'Elis Regina'
ORDER BY nome_album ASC;