
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `monitoramento_climatico_v2` ;

CREATE SCHEMA IF NOT EXISTS `monitoramento_climatico_v2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `monitoramento_climatico_v2` ;

DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`paises` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`paises` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nome_pais` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`locais` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`locais` (
  `id_local` INT NOT NULL AUTO_INCREMENT,
  `nome_local` VARCHAR(255) NOT NULL,
  `latitude` DECIMAL(9,6) NOT NULL,
  `longitude` DECIMAL(9,6) NOT NULL,
  `id_pais` INT NOT NULL,
  PRIMARY KEY (`id_local`),
  INDEX `id_pais` (`id_pais` ASC) VISIBLE,
  CONSTRAINT `locais_ibfk_1`
    FOREIGN KEY (`id_pais`)
    REFERENCES `monitoramento_climatico_v2`.`paises` (`id_pais`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`tipos_incidentes` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`tipos_incidentes` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo` VARCHAR(255) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`severidades` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`severidades` (
  `id_severidade` INT NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(50) NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_severidade`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`incidentes` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`incidentes` (
  `id_incidente` INT NOT NULL AUTO_INCREMENT,
  `id_local` INT NOT NULL,
  `id_tipo` INT NOT NULL,
  `id_severidade` INT NOT NULL,
  `data_ocorrencia` TIMESTAMP NOT NULL,
  `descricao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_incidente`),
  INDEX `id_local` (`id_local` ASC) VISIBLE,
  INDEX `id_tipo` (`id_tipo` ASC) VISIBLE,
  INDEX `id_severidade` (`id_severidade` ASC) VISIBLE,
  CONSTRAINT `incidentes_ibfk_1`
    FOREIGN KEY (`id_local`)
    REFERENCES `monitoramento_climatico_v2`.`locais` (`id_local`)
    ON DELETE CASCADE,
  CONSTRAINT `incidentes_ibfk_2`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `monitoramento_climatico_v2`.`tipos_incidentes` (`id_tipo`)
    ON DELETE CASCADE,
  CONSTRAINT `incidentes_ibfk_3`
    FOREIGN KEY (`id_severidade`)
    REFERENCES `monitoramento_climatico_v2`.`severidades` (`id_severidade`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`impactos` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`impactos` (
  `id_impacto` INT NOT NULL AUTO_INCREMENT,
  `id_incidente` INT NOT NULL,
  `descricao` TEXT NOT NULL,
  `custo_estimado` DECIMAL(15,2) NULL DEFAULT NULL,
  `numero_afetados` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_impacto`),
  INDEX `id_incidente` (`id_incidente` ASC) VISIBLE,
  CONSTRAINT `impactos_ibfk_1`
    FOREIGN KEY (`id_incidente`)
    REFERENCES `monitoramento_climatico_v2`.`incidentes` (`id_incidente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`relatorios` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`relatorios` (
  `id_relatorio` INT NOT NULL AUTO_INCREMENT,
  `id_incidente` INT NOT NULL,
  `data_criacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autor` VARCHAR(255) NULL DEFAULT NULL,
  `texto_relatorio` TEXT NOT NULL,
  PRIMARY KEY (`id_relatorio`),
  INDEX `id_incidente` (`id_incidente` ASC) VISIBLE,
  CONSTRAINT `relatorios_ibfk_1`
    FOREIGN KEY (`id_incidente`)
    REFERENCES `monitoramento_climatico_v2`.`incidentes` (`id_incidente`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `monitoramento_climatico_v2`.`log_incidentes` ;

CREATE TABLE IF NOT EXISTS `monitoramento_climatico_v2`.`log_incidentes` (
  `id_log` INT NOT NULL AUTO_INCREMENT,
  `data_log` TIMESTAMP NOT NULL,
  `id_incidente` INT NOT NULL,
  `id_local` INT NOT NULL,
  `id_tipo` INT NOT NULL,
  `id_severidade` INT NOT NULL,
  `data_ocorrencia` TIMESTAMP NOT NULL,
  `descricao` TEXT NULL,
  PRIMARY KEY (`id_log`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO paises (id_pais, nome_pais) VALUES
(1, 'Brasil'),
(2, 'Estados Unidos'),
(3, 'Canadá'),
(4, 'Índia'),
(5, 'Austrália'),
(6, 'Japão'),
(7, 'França'),
(8, 'África do Sul'),
(9, 'Alemanha'),
(10, 'China');

INSERT INTO locais (id_local, nome_local, latitude, longitude, id_pais) VALUES
(1, 'São Paulo', -23.5505, -46.6333, 1),
(2, 'Rio de Janeiro', -22.9068, -43.1729, 1),
(3, 'Nova York', 40.7128, -74.0060, 2),
(4, 'Toronto', 43.6511, -79.3839, 3),
(5, 'Nova Délhi', 28.6139, 77.2090, 4),
(6, 'Sydney', -33.8688, 151.2093, 5),
(7, 'Tóquio', 35.6895, 139.6917, 6),
(8, 'Paris', 48.8566, 2.3522, 7),
(9, 'Cidade do Cabo', -33.9249, 18.4241, 8),
(10, 'Berlim', 52.5200, 13.4050, 9);

INSERT INTO severidades (id_severidade, nivel, descricao) VALUES
(1, 'Baixa', 'Impacto mínimo, pouca ou nenhuma interrupção.'),
(2, 'Moderada', 'Impacto gerenciável, interrupção temporária.'),
(3, 'Alta', 'Impacto significativo, requer ação imediata.'),
(4, 'Crítica', 'Impacto extremo, perda substancial.'),
(5, 'Catastrófica', 'Impacto devastador, risco à vida e destruição ampla.');

INSERT INTO tipos_incidentes (id_tipo, nome_tipo, descricao) VALUES
(1, 'Furacão', 'Ventos fortes e chuvas intensas.'),
(2, 'Enchente', 'Acúmulo de água, causando alagamentos.'),
(3, 'Terremoto', 'Movimento sísmico causando destruição.'),
(4, 'Incêndio Florestal', 'Fogo em larga escala em áreas florestais.'),
(5, 'Seca', 'Falta de água devido à ausência prolongada de chuva.'),
(6, 'Tempestade de Granizo', 'Queda de pedras de gelo que causam danos.');

INSERT INTO incidentes (id_incidente, id_local, id_tipo, id_severidade, data_ocorrencia, descricao) VALUES
(1, 1, 2, 2, '2024-01-15 08:30:00', 'Chuvas intensas causaram enchentes em áreas baixas.'),
(2, 7, 1, 3, '2024-03-10 14:00:00', 'Ventos de alta velocidade causaram danos estruturais.'),
(3, 3, 4, 4, '2024-07-05 18:45:00', 'Incêndio florestal em áreas próximas.'),
(4, 4, 5, 1, '2024-06-12 10:00:00', 'Seca moderada sem grandes impactos.'),
(5, 5, 6, 3, '2024-08-20 15:00:00', 'Granizo destruiu plantações.'),
(6, 6, 3, 4, '2024-02-18 11:30:00', 'Terremoto causou danos a edifícios.'),
(7, 7, 1, 5, '2024-09-01 03:00:00', 'Furacão causou destruição massiva.'),
(8, 8, 2, 2, '2024-04-11 17:00:00', 'Enchentes em áreas próximas ao Rio Sena.'),
(9, 9, 6, 3, '2024-11-05 09:15:00', 'Granizo danificou propriedades.'),
(10, 10, 4, 5, '2024-12-01 16:00:00', 'Incêndio destruiu grande parte da vegetação local.');

INSERT INTO impactos (id_impacto, id_incidente, descricao, custo_estimado, numero_afetados) VALUES
(1, 1, 'Danos a residências e ruas.', 1000000, 500),
(2, 2, 'Estruturas danificadas e queda de árvores.', 5000000, 1200),
(3, 3, 'Floresta devastada.', 20000000, 0),
(4, 4, 'Agricultura afetada.', 300000, 200),
(5, 5, 'Plantações destruídas.', 1000000, 300),
(6, 6, 'Edifícios comprometidos.', 15000000, 1000),
(7, 7, 'Infraestruturas completamente destruídas.', 80000000, 10000),
(8, 8, 'Propriedades danificadas pelo rio.', 2000000, 400),
(9, 9, 'Carros e telhados danificados.', 500000, 50),
(10, 10, 'Vegetação perdida.', 10000000, 0);

INSERT INTO relatorios (id_relatorio, id_incidente, autor, texto_relatorio) VALUES
(1, 1, 'Carlos Silva', 'As enchentes em São Paulo resultaram em danos severos a residências. As autoridades evacuarão famílias das áreas afetadas e oferecerão abrigo temporário.'),
(2, 2, 'Maria Oliveira', 'Fortes ventos em Tóquio danificaram estruturas e árvores. Equipes de emergência trabalharam para remover os destroços e restaurar a energia elétrica rapidamente.'),
(3, 3, 'João Lima', 'Incêndios florestais próximos a Nova York consumiram grandes áreas de vegetação. Bombeiros atuaram 24 horas para controlar o fogo e evitar a propagação para áreas residenciais.'),
(4, 4, 'Ana Souza', 'A seca em Toronto impactou as colheitas, mas as autoridades locais implementaram um programa emergencial de irrigação para mitigar os prejuízos.'),
(5, 5, 'Ravi Kumar', 'Uma tempestade de granizo em Nova Délhi destruiu plantações locais. Agricultores receberam subsídios do governo para replantar suas culturas o mais rápido possível.'),
(6, 6, 'Akira Tanaka', 'O terremoto em Sydney causou danos significativos a infraestruturas. Equipes de busca e salvamento foram mobilizadas para resgatar sobreviventes sob os escombros.'),
(7, 7, 'John Smith', 'Um furacão devastador atingiu Tóquio, deslocando milhares de pessoas. Refugiados foram acomodados em abrigos e iniciou-se um plano de reconstrução das áreas afetadas.'),
(8, 8, 'Pierre Dubois', 'As enchentes em Paris causaram alagamentos em áreas históricas. Foram instaladas barreiras temporárias para conter o aumento das águas e proteger patrimônios culturais.'),
(9, 9, 'Hans Müller', 'Granizo em Berlim danificou propriedades e feriu pedestres. Autoridades criaram centros de apoio médico e distribuíram lonas para reparo de telhados danificados.'),
(10, 10, 'George Brown', 'O incêndio florestal próximo à Cidade do Cabo destruiu vastas áreas verdes. Foram criadas brigadas comunitárias para evitar novos focos de incêndio na região.');
