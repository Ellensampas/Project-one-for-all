SELECT 
	COUNT(DISTINCT M.titulo) AS cancoes,
  COUNT(DISTINCT A.nome_artista) AS artistas,
  COUNT(DISTINCT AB.nome_album) AS albuns
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.album AS AB ON M.album_id = AB.album_id
INNER JOIN SpotifyClone.artista AS A ON A.artista_id = AB.artista_id;