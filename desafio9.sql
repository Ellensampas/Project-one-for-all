SELECT 
	COUNT(H.data_reproducao) AS quantidade_musicas_no_historico
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.historico AS H ON U.usuario_id = H.usuario_id
WHERE U.nome_usuario = 'Barbara Liskov';