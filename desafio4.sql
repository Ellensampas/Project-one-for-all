SELECT 
	US.nome_usuario AS usuario,
	IF(MAX(YEAR(H.data_reproducao)) >= 2021,
		'Usuário ativo',
		'Usuário inativo') 	AS status_usuario
FROM SpotifyClone.usuario AS US
INNER JOIN SpotifyClone.historico AS H ON US.usuario_id = H.usuario_id
GROUP BY US.nome_usuario
ORDER BY US.nome_usuario;