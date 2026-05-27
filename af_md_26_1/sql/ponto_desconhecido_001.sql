DROP DATABASE IF EXISTS ponto_desconhecido;
CREATE DATABASE ponto_desconhecido;
USE ponto_desconhecido;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE pais (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nome_pais VARCHAR(100) UNIQUE NOT NULL,
    sigla VARCHAR(3) UNIQUE NOT NULL
);

CREATE TABLE cidade (
    id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_cidade VARCHAR(100) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais),
    UNIQUE (nome_cidade, id_pais) 
);

CREATE TABLE local_acampamento (
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    endereco VARCHAR(255),
    id_cidade INT,
    capacidade_maxima INT,
    preco_diaria DECIMAL(10,2),
    preco_diaria_baixa_temporada DECIMAL(10,2),
    preco_diaria_alta_temporada DECIMAL(10,2),
    area_terreno_m2 DECIMAL(10,2),
    id_usuario_cadastro INT,
    FOREIGN KEY (id_usuario_cadastro) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

CREATE TABLE avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_local INT NOT NULL,
    nota INT NOT NULL CHECK (nota >= 1 AND nota <= 5),
    comentario TEXT,
    data_avaliacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_local) REFERENCES local_acampamento(id_local)
);

CREATE TABLE caracteristica (
    id_caracteristica INT AUTO_INCREMENT PRIMARY KEY,
    nome_caracteristica VARCHAR(100) UNIQUE NOT NULL,
    descricao TEXT
);

CREATE TABLE local_caracteristica (
    id_local INT NOT NULL,
    id_caracteristica INT NOT NULL,
    PRIMARY KEY (id_local, id_caracteristica),
    FOREIGN KEY (id_local) REFERENCES local_acampamento(id_local),
    FOREIGN KEY (id_caracteristica) REFERENCES caracteristica(id_caracteristica)
);

CREATE TABLE evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_local INT NOT NULL,
    nome_evento VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_hora_inicio DATETIME NOT NULL,
    data_hora_fim DATETIME,
    capacidade_maxima INT,
    FOREIGN KEY (id_local) REFERENCES local_acampamento(id_local)
);

CREATE TABLE inscricao_evento (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_evento INT NOT NULL,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_inscricao VARCHAR(50) DEFAULT 'pendente',
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento)
);

CREATE TABLE badge (
    id_badge INT AUTO_INCREMENT PRIMARY KEY,
    nome_badge VARCHAR(100) UNIQUE NOT NULL,
    descricao TEXT,
    icone_url VARCHAR(255)
);

CREATE TABLE usuario_badge (
    id_usuario_badge INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_badge INT NOT NULL,
    data_conquista TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_badge) REFERENCES badge(id_badge)
);

CREATE TABLE historico_nota_pais_90d (
    id_pais INT NOT NULL,
    data_referencia DATE NOT NULL,              -- dia em que o snapshot foi calculado
    nota_media_90d DECIMAL(4,2) NOT NULL,
    qtd_avaliacoes_90d INT UNSIGNED NOT NULL,
    data_processamento DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_pais, data_referencia),

    CONSTRAINT fk_hist90d_pais
        FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);