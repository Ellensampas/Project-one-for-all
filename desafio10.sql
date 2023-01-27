SELECT 
	M.titulo AS nome,
    COUNT(H.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS M
INNER JOIN SpotifyClone.historico AS H ON M.musica_id = H.musica_id
INNER JOIN SpotifyClone.usuario AS U ON U.usuario_id = H.usuario_id
WHERE U.plano_id = 1 OR U.plano_id = 4
GROUP BY M.titulo
ORDER BY M.titulo;