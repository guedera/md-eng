USE biblioteca_musical;
CREATE OR REPLACE VIEW v_info_autor AS
	SELECT t.* FROM
		(SELECT Autor.nome_autor,
			   SUM(CD.preco_cd) as preco_total,
			   AVG(CD.preco_cd) AS preco_medio
		FROM CD
		JOIN Autor ON CD.id_autor = Autor.id_autor
		WHERE CD.estilo = 'MPB'
		GROUP BY Autor.nome_autor
		ORDER BY preco_medio) AS t
	WHERE t.preco_total < 140;


SELECT * FROM v_info_autor;

USE musica;

SELECT
	a.Nome_Autor AS nome,
    AVG(m.Duracao) AS duracao_media
FROM MUSICA AS m
INNER JOIN MUSICA_AUTOR AS ma USING(Codigo_Musica)
INNER JOIN AUTOR AS a USING(Codigo_Autor)
WHERE m.Nome_Musica LIKE '%a%'
GROUP BY a.Codigo_Autor
HAVING AVG(m.Duracao) BETWEEN 3.5 AND 3.8
ORDER BY duracao_media DESC;

CREATE OR REPLACE VIEW v_autor_duracao AS
	SELECT t.nome, t.duracao_media FROM (
		SELECT
			a.Nome_Autor AS nome,
			AVG(m.Duracao) AS duracao_media
		FROM MUSICA AS m
		INNER JOIN MUSICA_AUTOR AS ma USING(Codigo_Musica)
		INNER JOIN AUTOR AS a USING(Codigo_Autor)
		WHERE m.Nome_Musica LIKE '%a%'
		GROUP BY a.Codigo_Autor
		ORDER BY duracao_media DESC
	) AS t
	WHERE t.duracao_media BETWEEN 3.5 AND 3.8;
    
SELECT * FROM v_autor_duracao;

SELECT * FROM AUTOR;

SELECT a.Nome_Autor, COUNT(ma.Codigo_Autor) FROM MUSICA_AUTOR ma
INNER JOIN AUTOR a USING(Codigo_Autor)
GROUP BY ma.Codigo_Autor;

SELECT a.Nome_Autor, (SELECT COUNT(*) FROM MUSICA_AUTOR ma WHERE a.Codigo_Autor = ma.Codigo_Autor)
FROM AUTOR a;
