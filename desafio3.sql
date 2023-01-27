SELECT US.nome_usuario AS usuario,
	  COUNT(MUS.musica_id)AS qt_de_musicas_ouvidas,
    ROUND(SUM((MUS.duracao_segundos) / 60), 2) AS total_minutos
FROM SpotifyClone.usuario AS US
INNER JOIN SpotifyClone.historico AS H ON US.usuario_id = H.usuario_id
INNER JOIN SpotifyClone.musicas AS MUS ON H.musica_id = MUS.musica_id
GROUP BY US.nome_usuario
ORDER BY US.nome_usuario;