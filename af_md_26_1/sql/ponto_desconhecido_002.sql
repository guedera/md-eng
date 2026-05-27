SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE usuario;
TRUNCATE TABLE pais;
TRUNCATE TABLE cidade;
TRUNCATE TABLE local_acampamento;
TRUNCATE TABLE caracteristica;
TRUNCATE TABLE local_caracteristica;
TRUNCATE TABLE avaliacao;
TRUNCATE TABLE evento;
TRUNCATE TABLE inscricao_evento;
TRUNCATE TABLE badge;
TRUNCATE TABLE usuario_badge;

INSERT INTO usuario (id_usuario, nome_usuario, email, senha_hash, data_cadastro) VALUES
(1, 'aventureiro_master', 'master@gmail.com', 'hash123', '2025-01-15 10:00:00'),
(2, 'explorador_feliz', 'feliz@example.com', 'hash456', '2025-02-20 11:30:00'),
(3, 'natureza_lover', 'lover@example.com', 'hash789', '2025-03-10 14:00:00'),
(4, 'camper_pro', 'pro@example.com', 'hashabc', '2025-04-01 09:00:00'),
(5, 'viajante_solo', 'solo@example.com', 'hashdef', '2025-04-10 10:00:00'),
(6, 'explorador_urbano', 'urbano@example.com', 'hashghi', '2025-04-15 11:00:00'),
(7, 'trilheira_ana', 'ana.trilheira@gmail.com', 'hashjkl', '2025-05-01 08:30:00'),
(8, 'mochileiro_pedro', 'pedro.mochila@hotmail.com', 'hashmno', '2025-05-10 09:15:00'),
(9, 'surfista_carol', 'carol.surf@gmail.com', 'hashpqr', '2025-05-20 16:00:00'),
(10, 'montanhista_lucas', 'lucas.montanha@example.com', 'hashstu', '2025-06-01 07:45:00'),
(11, 'fotografo_marcos', 'marcos.foto@gmail.com', 'hashvwx', '2025-06-10 10:30:00'),
(12, 'biologa_julia', 'julia.bio@example.com', 'hashyza', '2025-06-15 14:20:00'),
(13, 'casal_aventura', 'casal.aventura@gmail.com', 'hashbcd', '2025-07-01 12:00:00'),
(14, 'campista_raiz', 'raiz@example.com', 'hashefg', '2025-07-10 06:00:00'),
(15, 'viajante_gabi', 'gabi.viagem@hotmail.com', 'hashhij', '2025-07-20 17:00:00');

INSERT INTO pais (id_pais, nome_pais, sigla) VALUES
(1, 'Brasil', 'BRA'),
(2, 'Argentina', 'ARG'),
(3, 'Chile', 'CHL'),
(4, 'Peru', 'PER'),
(5, 'Colômbia', 'COL'),
(6, 'Portugal', 'PRT'),
(7, 'Espanha', 'ESP'),
(8, 'França', 'FRA'),
(9, 'Itália', 'ITA'),
(10, 'Alemanha', 'DEU'),
(11, 'Japão', 'JPN'),
(12, 'China', 'CHN'),
(14, 'Tailândia', 'THA'),
(15, 'Indonésia', 'IDN'),
(16, 'África do Sul', 'ZAF'),
(18, 'Marrocos', 'MAR');

INSERT INTO cidade (id_cidade, nome_cidade, id_pais) VALUES
(1, 'Paraty', 1),
(2, 'Ubatuba', 1),
(3, 'Rio de Janeiro', 1),
(4, 'Alto Paraíso de Goiás', 1),
(5, 'Florianópolis', 1),
(6, 'São Thomé das Letras', 1),
(7, 'Bariloche', 2),
(8, 'El Chaltén', 2),
(9, 'Mendoza', 2),
(10, 'Pucón', 3),
(11, 'Torres del Paine', 3),
(12, 'Cusco', 4),
(13, 'Huaraz', 4),
(14, 'Santa Marta', 5),
(15, 'Sintra', 6),
(16, 'Aljezur', 6),
(17, 'Chamonix', 8),
(18, 'Cape Town', 16);

INSERT INTO local_acampamento (id_local, nome, descricao, latitude, longitude, endereco, id_cidade, capacidade_maxima, preco_diaria, preco_diaria_baixa_temporada, preco_diaria_alta_temporada, area_terreno_m2, id_usuario_cadastro) VALUES
(1, 'Recanto da Cachoeira', 'Local tranquilo com acesso a cachoeira e trilhas na mata atlântica.', -23.2200, -44.7000, 'Estrada da Cachoeira, s/n', 1, 50, 80.00, 60.00, 100.00, 5000.00, 1),
(2, 'Camping Trindade', 'Acampamento rústico entre a praia e a montanha, a poucos passos da Praia do Meio.', -23.3530, -44.7290, 'Rua Principal de Trindade, 45', 1, 35, 65.00, 45.00, 85.00, 2800.00, 7),
(3, 'Praia Secreta Camping', 'Acampamento pé na areia, ideal para surfistas e amantes do mar.', -23.4500, -45.0500, 'Rua da Praia, 100', 2, 30, 120.00, 90.00, 150.00, 3000.00, 1),
(4, 'Floresta da Tijuca Camp', 'Camping urbano em meio à maior floresta urbana do mundo, com trilhas e mirantes.', -22.9500, -43.2500, 'Estrada da Floresta, 123', 3, 25, 70.00, 50.00, 90.00, 2500.00, 4),
(5, 'Camping Alto Paraíso', 'Base para explorar a Chapada dos Veadeiros, com piscina natural no terreno.', -14.1350, -47.5200, 'Rua dos Cristais, 200', 4, 60, 75.00, 55.00, 95.00, 7000.00, 1),
(6, 'Vale da Lua Camp', 'Acampamento próximo ao Vale da Lua, formações rochosas únicas e rio cristalino.', -14.1500, -47.5800, 'Estrada GO-239, km 18', 4, 40, 90.00, 70.00, 120.00, 5500.00, 7),
(7, 'Mirante dos Cristais', 'Camping com vista panorâmica do cerrado e céu estrelado espetacular.', -14.1000, -47.4800, 'Estrada para São Jorge, s/n', 4, 20, 100.00, 80.00, 130.00, 3200.00, 14),
(8, 'Camping Lagoinha', 'Acampamento familiar na praia da Lagoinha do Leste, acesso somente por trilha.', -27.7700, -48.5000, 'Trilha da Lagoinha do Leste', 5, 15, 55.00, 40.00, 75.00, 1800.00, 10),
(9, 'Montanha Azul Park', 'Vista panorâmica das montanhas patagônicas, clima frio e lagos cristalinos.', -41.1300, -71.3800, 'Rota 40, km 20', 7, 70, 100.00, 80.00, 130.00, 8000.00, 2),
(10, 'Patagonia Base Camp', 'Campo base para escaladas no Monte Fitz Roy, estrutura básica e vento forte.', -49.3310, -72.8860, 'Avenida San Martín, s/n', 8, 45, 130.00, 100.00, 170.00, 6500.00, 10),
(11, 'Camping Los Glaciares', 'Acampamento à beira do Lago Viedma, com vista para geleiras.', -49.3100, -72.9100, 'Ruta Provincial 23, km 5', 8, 30, 115.00, 95.00, 145.00, 4000.00, 14),
(12, 'Lago Escondido', 'Acampamento isolado à beira de um lago cristalino, ao pé do vulcão Villarrica.', -39.2700, -71.9500, 'Caminho do Lago, s/n', 10, 20, 95.00, 75.00, 110.00, 4500.00, 3),
(13, 'Camping Torres', 'Acampamento no coração do Parque Nacional Torres del Paine, vistas incomparáveis.', -50.9420, -73.4060, 'Interior Parque Nacional', 11, 55, 150.00, 120.00, 200.00, 9000.00, 10),
(14, 'Vale Sagrado Camping', 'Acampamento nas montanhas com vista para ruínas incas e andenes agrícolas.', -13.3900, -72.1100, 'Estrada do Vale Sagrado, s/n', 12, 40, 110.00, 90.00, 140.00, 6000.00, 5),
(15, 'Cordillera Blanca Camp', 'Base para trekking na Cordilheira Branca, altitude 3800m com vista para nevados.', -9.5280, -77.5280, 'Carretera Huaraz-Yungay, km 12', 13, 35, 85.00, 65.00, 105.00, 4200.00, 14),
(16, 'Tayrona Jungle Camp', 'Acampamento na selva do Parque Tayrona, entre montanhas e praias caribenhas.', 11.3000, -74.0800, 'Parque Nacional Tayrona, Sector Arrecifes', 14, 50, 105.00, 85.00, 135.00, 5800.00, 7),
(17, 'Algarve Wild Camp', 'Camping selvagem na Costa Vicentina, falésias e praias desertas.', 37.3200, -8.8600, 'Estrada da Arrifana, s/n', 16, 25, 60.00, 45.00, 80.00, 3500.00, 4),
(18, 'Mont Blanc Base Camp', 'Campo base alpino com vista para o Mont Blanc, ideal para alpinistas.', 45.9237, 6.8694, 'Route des Pèlerins, 15', 17, 40, 140.00, 110.00, 180.00, 5200.00, 10),
(19, 'Table Mountain Camp', 'Acampamento com vista para a Table Mountain e o oceano Atlântico.', -33.9628, 18.4098, 'Tafelberg Road, 22', 18, 30, 125.00, 95.00, 160.00, 4800.00, 2);

INSERT INTO caracteristica (id_caracteristica, nome_caracteristica, descricao) VALUES
(1, 'Wi-Fi', 'Acesso à internet sem fio'),
(2, 'Churrasqueira', 'Área com churrasqueira disponível'),
(3, 'Acesso a Rio', 'Localizado próximo ou com acesso direto a um rio'),
(4, 'Banheiro Quente', 'Banheiros com chuveiro quente'),
(5, 'Permite Pets', 'Animais de estimação são permitidos'),
(6, 'Tomada Elétrica', 'Pontos de energia elétrica para barracas'),
(7, 'Cozinha Compartilhada', 'Cozinha equipada para uso dos campistas'),
(8, 'Lavanderia', 'Máquinas de lavar e secar roupa'),
(9, 'Estacionamento', 'Área de estacionamento para veículos'),
(10, 'Loja de Conveniência', 'Pequena loja com itens básicos para campistas');

INSERT INTO local_caracteristica (id_local, id_caracteristica) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 6),
(2, 2), (2, 3), (2, 5),
(3, 2), (3, 5), (3, 6),
(4, 2), (4, 5), (4, 8), (4, 9),
(5, 1), (5, 4), (5, 6), (5, 7), (5, 9), (5, 10),
(6, 2), (6, 3), (6, 4),
(7, 9),
(8, 3),
(9, 1), (9, 4), (9, 6), (9, 7),
(10, 4), (10, 7), (10, 9),
(11, 2), (11, 4),
(12, 3), (12, 5),
(13, 4), (13, 6), (13, 10),
(14, 1), (14, 4), (14, 7),
(15, 7), (15, 9),
(16, 2), (16, 3), (16, 4), (16, 5),
(17, 2), (17, 4), (17, 5), (17, 9),
(18, 1), (18, 4), (18, 6), (18, 7), (18, 10),
(19, 1), (19, 2), (19, 4), (19, 6), (19, 9);

INSERT INTO avaliacao (id_avaliacao, id_usuario, id_local, nota, comentario, data_avaliacao) VALUES
(1,  2,  1, 5, 'Lugar incrível, cachoeira maravilhosa!', '2025-05-01 10:00:00'),
(2,  3,  1, 4, 'Muito bom, mas o Wi-Fi poderia ser melhor.', '2025-05-05 11:00:00'),
(3,  4,  1, 5, 'Voltei ao Recanto da Cachoeira, sempre excelente!', '2025-06-10 12:00:00'),
(4,  8,  1, 4, 'Ótimo custo-benefício, cachoeira a 5 minutos.', '2025-07-02 09:30:00'),
(5,  11, 2, 3, 'Bonito mas estrutura bem básica. Banheiros precisam de melhoria.', '2025-06-20 14:00:00'),
(6,  9,  2, 4, 'Praia linda e camping charmoso!', '2025-07-15 16:30:00'),
(7,  1,  3, 3, 'Praia bonita, mas um pouco lotado no feriado.', '2025-05-10 12:00:00'),
(8,  3,  3, 4, 'Boas ondas para surfar!', '2025-05-22 15:00:00'),
(9,  9,  3, 5, 'Melhor camping de praia que já fui. Ondas perfeitas!', '2025-06-18 11:00:00'),
(10, 1,  4, 4, 'Surpreendente ter um camping assim na cidade.', '2025-06-05 11:00:00'),
(11, 12, 4, 4, 'Muita biodiversidade! Vi tucanos e saguis no camping.', '2025-07-08 08:45:00'),
(12, 5,  5, 5, 'Chapada dos Veadeiros é surreal. Camping excelente!', '2025-06-01 10:00:00'),
(13, 8,  5, 4, 'Boa estrutura, piscina natural é o diferencial.', '2025-06-25 14:00:00'),
(14, 11, 5, 5, 'Fotos incríveis! O céu noturno é espetacular.', '2025-07-10 22:00:00'),
(15, 12, 6, 5, 'As formações rochosas são de outro mundo.', '2025-07-01 09:00:00'),
(16, 3,  6, 4, 'Lindo, mas o acesso é um pouco difícil com chuva.', '2025-07-20 15:00:00'),
(17, 11, 7, 5, 'O pôr do sol visto daqui é o mais bonito que já fotografei.', '2025-08-01 18:30:00'),
(18, 10, 8, 4, 'A trilha até lá vale cada passo. Praia paradisíaca.', '2025-07-05 10:00:00'),
(19, 9,  8, 3, 'Bonito mas muito rústico, sem estrutura nenhuma.', '2025-08-12 11:00:00'),
(20, 4,  9, 5, 'Vista espetacular e ótima estrutura.', '2025-05-15 13:00:00'),
(21, 6,  9, 4, 'Muito frio mas muito bonito. Leve saco de dormir reforçado.', '2025-06-28 20:00:00'),
(22, 15, 9, 5, 'Melhor camping da Patagônia Argentina!', '2025-08-05 12:00:00'),
(23, 10, 10, 5, 'Perfeito como base para o Fitz Roy. Estrutura adequada.', '2025-07-25 07:00:00'),
(24, 8,  10, 4, 'Vento forte, mas a paisagem compensa tudo.', '2025-08-15 09:00:00'),
(25, 14, 11, 4, 'Vista para as geleiras é hipnotizante. Frio intenso.', '2025-08-20 10:00:00'),
(26, 2,  12, 4, 'Perfeito para quem busca isolamento.', '2025-05-20 14:00:00'),
(27, 6,  12, 3, 'Bonito, mas achei muito isolado. Sem sinal de celular.', '2025-07-30 16:00:00'),
(28, 10, 13, 5, 'Torres del Paine é o lugar mais bonito do planeta.', '2025-08-01 06:00:00'),
(29, 14, 13, 5, 'Experiência transformadora. Voltarei com certeza.', '2025-08-10 08:00:00'),
(30, 5,  13, 4, 'Incrível, mas o preço é salgado.', '2025-08-25 12:00:00'),
(31, 5,  14, 5, 'Experiência mística no Vale Sagrado!', '2025-06-01 10:00:00'),
(32, 3,  14, 4, 'Altitude alta, leve folhas de coca. Camping muito bom.', '2025-07-12 15:00:00'),
(33, 10, 15, 4, 'Trekking espetacular. Aclimatem-se bem antes de subir.', '2025-08-18 07:30:00'),
(34, 2,  16, 5, 'Selva e praia caribenha no mesmo lugar. Mágico!', '2025-07-05 11:00:00'),
(35, 12, 16, 4, 'Fauna incrível! Vi macacos bugio e iguanas enormes.', '2025-08-02 09:00:00'),
(36, 4,  17, 4, 'Costa Vicentina é linda. Camping simples e agradável.', '2025-07-20 18:00:00'),
(37, 10, 18, 5, 'Estrutura impecável para alta montanha. Equipe profissional.', '2025-07-15 06:00:00'),
(38, 14, 18, 5, 'O melhor camping alpino que conheço. Mont Blanc é grandioso.', '2025-08-05 07:00:00'),
(39, 2,  19, 5, 'Nascer do sol com vista para Table Mountain. Inesquecível!', '2025-06-15 06:30:00'),
(40, 11, 19, 4, 'Fotos espetaculares. Estrutura boa para a região.', '2025-07-28 17:00:00');

INSERT INTO evento (id_evento, id_local, nome_evento, descricao, data_hora_inicio, data_hora_fim, capacidade_maxima) VALUES
(1,  1,  'Trilha Guiada à Cachoeira', 'Trilha com guia experiente até a cachoeira principal.', '2025-06-10 09:00:00', '2025-06-10 12:00:00', 20),
(2,  9,  'Observação de Estrelas', 'Noite de observação com telescópios e explicações sobre constelações do hemisfério sul.', '2025-07-01 20:00:00', '2025-07-01 23:00:00', 30),
(3,  1,  'Oficina de Nós e Amarrações', 'Aprenda técnicas essenciais de nós para acampamento e escalada.', '2025-06-11 14:00:00', '2025-06-11 16:00:00', 15),
(4,  14, 'Cerimônia Andina', 'Experiência cultural com rituais tradicionais incas no Vale Sagrado.', '2025-08-01 18:00:00', '2025-08-01 22:00:00', 10),
(5,  4,  'Workshop de Sobrevivência Urbana', 'Aprenda técnicas de sobrevivência e orientação em ambiente urbano.', '2025-08-15 09:00:00', '2025-08-15 17:00:00', 15),
(6,  5,  'Festival de Astrofotografia', 'Noite dedicada à fotografia do céu estrelado da Chapada dos Veadeiros.', '2025-09-01 19:00:00', '2025-09-02 01:00:00', 25),
(7,  13, 'Trekking Circuito W', 'Trekking guiado pelo famoso Circuito W de Torres del Paine.', '2025-10-01 06:00:00', '2025-10-04 18:00:00', 12),
(8,  3,  'Campeonato de Surf', 'Competição amadora de surf para campistas e visitantes.', '2025-09-15 07:00:00', '2025-09-15 17:00:00', 20),
(9,  18, 'Curso de Alpinismo Básico', 'Curso de dois dias sobre técnicas básicas de alpinismo no Mont Blanc.', '2025-09-20 08:00:00', '2025-09-21 16:00:00', 10),
(10, 16, 'Trilha Noturna na Selva', 'Caminhada noturna guiada pela selva do Parque Tayrona.', '2025-10-10 20:00:00', '2025-10-10 23:00:00', 15),
(11, 7,  'Meditação ao Nascer do Sol', 'Sessão de meditação guiada com vista para o cerrado ao amanhecer.', '2025-09-10 05:30:00', '2025-09-10 07:00:00', 20),
(12, 10, 'Escalada no Fitz Roy', 'Expedição guiada de escalada ao Monte Fitz Roy para escaladores intermediários.', '2025-11-01 05:00:00', '2025-11-02 18:00:00', 8);

INSERT INTO inscricao_evento (id_inscricao, id_usuario, id_evento, data_inscricao, status_inscricao) VALUES
(1,  2,  1, '2025-05-25 08:00:00', 'confirmada'),
(2,  3,  1, '2025-05-26 09:00:00', 'confirmada'),
(3,  7,  1, '2025-05-27 10:00:00', 'confirmada'),
(4,  8,  1, '2025-05-28 14:00:00', 'confirmada'),
(5,  1,  2, '2025-06-01 10:00:00', 'pendente'),
(6,  4,  2, '2025-06-02 11:00:00', 'confirmada'),
(7,  11, 2, '2025-06-03 09:00:00', 'confirmada'),
(8,  2,  3, '2025-06-05 10:00:00', 'confirmada'),
(9,  7,  3, '2025-06-05 11:00:00', 'confirmada'),
(10, 14, 3, '2025-06-06 08:00:00', 'confirmada'),
(11, 5,  4, '2025-07-15 09:00:00', 'confirmada'),
(12, 3,  4, '2025-07-16 10:00:00', 'confirmada'),
(13, 6,  5, '2025-08-01 10:00:00', 'pendente'),
(14, 15, 5, '2025-08-02 11:00:00', 'confirmada'),
(15, 11, 6, '2025-08-10 14:00:00', 'confirmada'),
(16, 7,  6, '2025-08-11 09:00:00', 'confirmada'),
(17, 12, 6, '2025-08-12 10:00:00', 'confirmada'),
(18, 8,  6, '2025-08-13 08:00:00', 'pendente'),
(19, 10, 7, '2025-09-01 07:00:00', 'confirmada'),
(20, 14, 7, '2025-09-02 08:00:00', 'confirmada'),
(21, 7,  7, '2025-09-03 09:00:00', 'confirmada'),
(22, 5,  7, '2025-09-04 10:00:00', 'pendente'),
(23, 9,  8, '2025-09-01 08:00:00', 'confirmada'),
(24, 1,  8, '2025-09-02 09:00:00', 'confirmada'),
(25, 10, 9, '2025-09-05 07:00:00', 'confirmada'),
(26, 7,  9, '2025-09-06 08:00:00', 'confirmada'),
(27, 14, 9, '2025-09-07 09:00:00', 'pendente'),
(28, 12, 10, '2025-09-20 15:00:00', 'confirmada'),
(29, 2,  10, '2025-09-21 16:00:00', 'confirmada'),
(30, 3,  11, '2025-08-25 20:00:00', 'confirmada'),
(31, 15, 11, '2025-08-26 21:00:00', 'confirmada'),
(32, 10, 12, '2025-10-15 06:00:00', 'confirmada'),
(33, 14, 12, '2025-10-16 07:00:00', 'confirmada');

INSERT INTO badge (id_badge, nome_badge, descricao, icone_url) VALUES
(1, 'Aventureiro Iniciante', 'Completou sua primeira avaliação.', 'url_icone_iniciante.png'),
(2, 'Mestre da Trilha', 'Participou de 3 eventos de trilha.', 'url_icone_trilha.png'),
(3, 'Explorador Global', 'Avaliou locais em 3 países diferentes.', 'url_icone_global.png'),
(4, 'Viajante Urbano', 'Acampou em um local dentro de uma cidade.', 'url_icone_urbano.png'),
(5, 'Fotógrafo da Natureza', 'Participou de um evento de fotografia na natureza.', 'url_icone_foto.png'),
(6, 'Campista Veterano', 'Avaliou mais de 5 locais de acampamento.', 'url_icone_veterano.png');

INSERT INTO usuario_badge (id_usuario_badge, id_usuario, id_badge, data_conquista) VALUES
(1,  2,  1, '2025-05-01 10:05:00'),
(2,  3,  1, '2025-05-05 11:05:00'),
(3,  4,  1, '2025-05-15 13:05:00'),
(4,  1,  1, '2025-05-10 12:30:00'),
(5,  5,  1, '2025-06-01 10:05:00'),
(6,  8,  1, '2025-07-02 10:00:00'),
(7,  4,  4, '2025-06-05 11:05:00'),
(8,  2,  3, '2025-07-05 11:30:00'),
(9,  10, 2, '2025-08-01 06:30:00'),
(10, 10, 6, '2025-08-18 08:00:00'),
(11, 11, 5, '2025-08-10 14:30:00'),
(12, 14, 1, '2025-08-20 10:30:00'),
(13, 12, 1, '2025-07-01 09:30:00');

INSERT INTO cidade (id_cidade, nome_cidade, id_pais) VALUES
(19, 'Cortina d''Ampezzo', 9),
(20, 'Castiglione della Pescaia', 9);

INSERT INTO local_acampamento (id_local, nome, descricao, latitude, longitude, endereco, id_cidade, capacidade_maxima, preco_diaria, preco_diaria_baixa_temporada, preco_diaria_alta_temporada, area_terreno_m2, id_usuario_cadastro) VALUES
(20, 'Dolomiti Adventure Camp', 'Localizado no coração das Dolomitas, perfeito para trekking e escalada com vista para as montanhas.', 46.5383, 12.1373, 'Via Passo Tre Croci, 15', 19, 60, 130.00, 95.00, 175.00, 6000.00, 10),
(21, 'Maremma Seaside Camping', 'Camping de luxo à beira-mar na Toscana, cercado por pinheiros e águas cristalinas.', 42.7663, 10.8732, 'Via delle Padule, s/n', 20, 100, 110.00, 80.00, 160.00, 12000.00, 14);

SET FOREIGN_KEY_CHECKS = 1;

