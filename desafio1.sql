DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      tipo_plano VARCHAR(90) NOT NULL,
      valor_plano DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome_artista VARCHAR(90) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      album_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome_album VARCHAR(90) NOT NULL,
      artista_id INT NOT NULL,
      ano_lancamento YEAR(4) NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.musicas(
      musica_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      titulo VARCHAR(90) NOT NULL,
      album_id INT NOT NULL,
      duracao_segundos INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES album(album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome_usuario VARCHAR(90) NOT NULL,
      idade_usuario INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas_seguidos(
      artista_id INT,
      usuario_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY (artista_id, usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      usuario_id INT NOT NULL,
      musica_id INT NOT NULL,
      data_reproducao DATETIME(20) NOT NULL,
      CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
      FOREIGN KEY (musica_id) REFERENCES musica(musica_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plano (tipo_plano, valor_plano)
  VALUES
    ('gratuito', 0,00),
    ('familiar', 7,99),
    ('universitario', 5,99),
    ('pessoal', 6,99);

  INSERT INTO SpotifyClone.artista (nome_artista)
  VALUES
    ('Beyonce'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.album (nome_album, ano_lancamento, artista_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

  INSERT INTO SpotifyClone.musicas (titulo, album_id, duracao_segundos)
  VALUES
    ('BREAK MY SOUL', 1, 279), 
    ('VIRGO’S GROOVE', 1, 369),
    ('ALIEN SUPERSTAR', 1, 116 ),
    ('Don’t Stop Me Now', 2, 203),
    ('Under Pressure', 3, 152),
    ('Como Nossos Pais', 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 5, 207),
    ('Samba em Paris', 6, 267),
    ('The Bard’s Song', 7, 244),
    ('Feeling Good', 8, 100);

  INSERT INTO SpotifyClone.usuario (nome_usuario, idade_usuario, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

  INSERT INTO SpotifyClone.artistas_seguidos (usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (7, 6),
    (9, 3);

  INSERT INTO SpotifyClone.historico (usuario_id, musica_id, data_reproducao)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
