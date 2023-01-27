SELECT M.titulo AS cancao, 
COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico AS H ON M.musica_id = H.musica_id
GROUP BY M.titulo
ORDER BY reproducoes DESC, M.titulo ASC
LIMIT 2;