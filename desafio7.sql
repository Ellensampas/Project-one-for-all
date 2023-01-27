SELECT 
	A.nome_artista AS artista,
	AL.nome_album AS album,
COUNT(ARS.artista_id) AS seguidores
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album AS AL ON A.artista_id = AL.artista_id
INNER JOIN SpotifyClone.artistas_seguidos AS ARS ON A.artista_id = ARS.artista_id
GROUP BY AL.album_id
ORDER BY seguidores DESC, artista, album;