-- Criando o banco de dados.
CREATE SCHEMA `insight_places` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

--Criando as tabelas.
USE insight_places;   -- Usando o bando de dados.
CREATE TABLE proprietarios (                -- Criando as tabelas.
proprietario_id VARCHAR (255) PRIMARY KEY,
nome VARCHAR (255),
cpf_cpnj VARCHAR (20),
contato VARCHAR (255)
);

CREATE TABLE clientes (
cliente_id VARCHAR (255) PRIMARY KEY,
nome VARCHAR (255),
cpf VARCHAR (14),
contato VARCHAR (255)
);

CREATE TABLE enderecos (
endereco_id VARCHAR (255) PRIMARY KEY,
rua VARCHAR (255),
numero INT,
bairro VARCHAR (255),
cidade VARCHAR (255),
estado VARCHAR (255),
cep VARCHAR (10)
);

CREATE TABLE hospedagens (
hospedagem_id VARCHAR (255) PRIMARY KEY,
tipo VARCHAR (50),
endereco_id VARCHAR (255),
proprietario_id VARCHAR (255),
	ativo bool,
FOREIGN KEY (endereco_id) REFERENCES enderecos (endereco_id),
FOREIGN KEY (proprietario_id) REFERENCES proprietarios (proprietario_id)
);

CREATE TABLE alugueis (
    aluguel_id VARCHAR(255) PRIMARY KEY,
    cliente_id VARCHAR(255),
    hospedagem_id VARCHAR(255),
    data_inicio DATE,
    data_fim DATE,
    preco_total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (hospedagem_id) REFERENCES hospedagens(hospedagem_id)
);

CREATE TABLE avaliacoes (
avaliacao_id VARCHAR(255) PRIMARY KEY,
cliente_id VARCHAR(255),
hospedagem_id VARCHAR(255),
nota INT,
comentario TEXT,
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
FOREIGN KEY (hospedagem_id) REFERENCES hospedagens(hospedagem_id)
);


-- Inserindo os dados na tabela enderecos.
INSERT INTO enderecos VALUES ('1', 'Lagoa de Teixeira', '72', 'Tirol', 'Moraes', 'SP', '87362-365');
INSERT INTO enderecos VALUES ('2', 'Rua Nicole Barbosa', '65', 'Funcionários', 'Costela', 'RO', '99644-164');
INSERT INTO enderecos VALUES ('3', 'Rua de da Costa', '465', 'Itaipu', 'Monteiro', 'CE', '30053-759');
INSERT INTO enderecos VALUES ('4', 'Jardim Luana da Luz', '8', 'Barroca', 'Carvalho de Goiás', 'MT', '31057-762');
INSERT INTO enderecos VALUES ('5', 'Recanto Duarte', '15', 'Vila Mangueiras', 'Barros da Prata', 'RN', '55248-672');
INSERT INTO enderecos VALUES ('6', 'Distrito Azevedo', '132', 'Savassi', 'Cunha', 'PR', '11039-854');
INSERT INTO enderecos VALUES ('7', 'Rua Maria Sophia Gomes', '5', 'Novo Tupi', 'da Costa', 'CE', '60966-235');
INSERT INTO enderecos VALUES ('8', 'Loteamento Vitória Pereira', '56', 'Acaba Mundo', 'Oliveira', 'SE', '27388-833');
INSERT INTO enderecos VALUES ('9', 'Largo Cavalcanti', '45', 'Beira Linha', 'Viana', 'MA', '74524-432');
INSERT INTO enderecos VALUES ('10', 'Colônia Davi Rodrigues', '46', 'Saudade', 'Cunha', 'MS', '45541-255');
INSERT INTO enderecos VALUES ('11', 'Lago Eduardo da Rocha', '233', 'Cardoso', 'Nunes', 'MT', '71516-486');
INSERT INTO enderecos VALUES ('12', 'Jardim de Azevedo', '90', 'Estrela Do Oriente', 'da Paz', 'PE', '71735-743');
INSERT INTO enderecos VALUES ('13', 'Pátio Pietra Pires', '15', 'Estoril', 'da Rosa', 'GO', '55078-173');
INSERT INTO enderecos VALUES ('14', 'Via de da Cunha', '57', 'Confisco', 'Monteiro', 'SE', '10142-527');
INSERT INTO enderecos VALUES ('15', 'Distrito de Lopes', '8', 'Nazare', 'Ramos de Almeida', 'SC', '26726-356');
INSERT INTO enderecos VALUES ('16', 'Avenida Alexia Nogueira', '73', 'Indaiá', 'Cardoso', 'RO', '19907-977');
INSERT INTO enderecos VALUES ('17', 'Conjunto Alves', '3', 'Santa Margarida', 'Azevedo', 'PA', '31119-773');
INSERT INTO enderecos VALUES ('18', 'Distrito Pedro Lucas Rezende', '5', 'Canadá', 'Moura', 'RR', '26178-794');
INSERT INTO enderecos VALUES ('19', 'Esplanada Barros', '2', 'Jardim Montanhês', 'da Conceição', 'PB', '73795-930');
INSERT INTO enderecos VALUES ('20', 'Vila Maria Clara Martins', '91', 'Universo', 'Nunes', 'GO', '37308-212');

-- Inserindo os dados na tabela clientes.
INSERT INTO clientes VALUES ('1', 'João Miguel Sales', '658.190.237-30', 'joão_352@dominio.com');
INSERT INTO clientes VALUES ('2', 'Gustavo Carvalho', '134.975.082-41', 'gustavo_802@dominio.com');
INSERT INTO clientes VALUES ('3', 'Maria Eduarda Correia', '298.460.513-60', 'maria_510@dominio.com');
INSERT INTO clientes VALUES ('4', 'Catarina da Cunha', '671.528.940-94', 'catarina_276@dominio.com');
INSERT INTO clientes VALUES ('5', 'Murilo Melo', '469.510.387-75', 'murilo_366@dominio.com');
INSERT INTO clientes VALUES ('6', 'Dra. Laura Ribeiro', '783.065.942-74', 'dra._272@dominio.com');
INSERT INTO clientes VALUES ('7', 'Dra. Lívia Barros', '284.563.071-90', 'dra._406@dominio.com');
INSERT INTO clientes VALUES ('8', 'Cauê Sales', '635.871.492-91', 'cauê_749@dominio.com');
INSERT INTO clientes VALUES ('9', 'Enrico Pires', '314.762.580-07', 'enrico_716@dominio.com');
INSERT INTO clientes VALUES ('10', 'Cauã da Mata', '162.854.379-55', 'cauã_723@dominio.com');
INSERT INTO clientes VALUES ('11', 'Maria Fernanda Aragão', '064.973.258-83', 'maria_181@dominio.com');
INSERT INTO clientes VALUES ('12', 'João Miguel da Rosa', '583.104.692-33', 'joão_154@dominio.com');
INSERT INTO clientes VALUES ('13', 'Joaquim Barbosa', '295.701.486-67', 'joaquim_409@dominio.com');
INSERT INTO clientes VALUES ('14', 'Evelyn Teixeira', '359.872.614-73', 'evelyn_614@dominio.com');
INSERT INTO clientes VALUES ('15', 'Sophie Rocha', '670.421.598-02', 'sophie_737@dominio.com');
INSERT INTO clientes VALUES ('16', 'Calebe Rezende', '650.793.821-12', 'calebe_130@dominio.com');
INSERT INTO clientes VALUES ('17', 'Lívia Azevedo', '341.659.820-24', 'lívia_587@dominio.com');
INSERT INTO clientes VALUES ('18', 'Emanuelly Cardoso', '784.152.063-80', 'emanuelly_496@dominio.com');
INSERT INTO clientes VALUES ('19', 'Sra. Maysa Cunha', '423.659.108-15', 'sra._216@dominio.com');
INSERT INTO clientes VALUES ('20', 'Carlos Eduardo Rocha', '206.598.743-00', 'carlos_218@dominio.com');

-- Inserindo os dados na proprietarios.
INSERT INTO proprietarios VALUES ('1', 'Luna Fernandes', '408.153.796-84', 'luna_537@dominio.com');
INSERT INTO proprietarios VALUES ('2', 'Bárbara Melo', '389.106.427-69', 'bárbara_228@dominio.com');
INSERT INTO proprietarios VALUES ('3', 'Maria Fernanda Oliveira', '759.230.468-65', 'maria_858@dominio.com');
INSERT INTO proprietarios VALUES ('4', 'Vinicius Pires', '528.413.069-33', 'vinicius_242@dominio.com');
INSERT INTO proprietarios VALUES ('5', 'Dr. Pietro Mendes', '564.783.920-74', 'dr._294@dominio.com');
INSERT INTO proprietarios VALUES ('6', 'Evelyn Porto', '614.802.739-96', 'evelyn_412@dominio.com');
INSERT INTO proprietarios VALUES ('7', 'Sra. Marcela Silva', '803.967.452-29', 'sra._374@dominio.com');
INSERT INTO proprietarios VALUES ('8', 'Marina Nunes', '794.180.652-58', 'marina_947@dominio.com');
INSERT INTO proprietarios VALUES ('9', 'João Vitor Moura', '956.270.843-83', 'joão_590@dominio.com');
INSERT INTO proprietarios VALUES ('10', 'Ana Júlia Nunes', '269.507.384-47', 'ana_970@dominio.com');
INSERT INTO proprietarios VALUES ('11', 'Luna Nogueira', '174.295.063-99', 'luna_619@dominio.com');
INSERT INTO proprietarios VALUES ('12', 'Enzo Gabriel Monteiro', '593.204.876-00', 'enzo_715@dominio.com');
INSERT INTO proprietarios VALUES ('13', 'Ana Vitória Azevedo', '071.236.948-13', 'ana_307@dominio.com');
INSERT INTO proprietarios VALUES ('14', 'Maria Julia Fernandes', '503.192.874-32', 'maria_202@dominio.com');
INSERT INTO proprietarios VALUES ('15', 'Gabriela Novaes', '739.245.081-60', 'gabriela_243@dominio.com');
INSERT INTO proprietarios VALUES ('16', 'Enrico Lopes', '052.617.839-68', 'enrico_955@dominio.com');
INSERT INTO proprietarios VALUES ('17', 'Pedro Miguel Ferreira', '324.756.190-07', 'pedro_168@dominio.com');
INSERT INTO proprietarios VALUES ('18', 'Esther Souza', '271.583.069-68', 'esther_317@dominio.com');
INSERT INTO proprietarios VALUES ('19', 'Ana Beatriz Gonçalves', '640.182.795-58', 'ana_922@dominio.com');
INSERT INTO proprietarios VALUES ('20', 'Ana Vitória Mendes', '284.619.573-00', 'ana_916@dominio.com');

-- Inserindo os dados na hospedagem.
INSERT INTO hospedagens VALUES ('1', 'casa', '1', '1', '0');
INSERT INTO hospedagens VALUES ('2', 'casa', '2', '2', '1');
INSERT INTO hospedagens VALUES ('3', 'hotel', '3', '3', '1');
INSERT INTO hospedagens VALUES ('4', 'casa', '4', '4', '0');
INSERT INTO hospedagens VALUES ('5', 'apartamento', '5', '5', '0');
INSERT INTO hospedagens VALUES ('6', 'casa', '6', '6', '0');
INSERT INTO hospedagens VALUES ('7', 'casa', '7', '7', '1');
INSERT INTO hospedagens VALUES ('8', 'casa', '8', '8', '1');
INSERT INTO hospedagens VALUES ('9', 'hotel', '9', '9', '1');
INSERT INTO hospedagens VALUES ('10', 'apartamento', '10', '10', '0');
INSERT INTO hospedagens VALUES ('11', 'apartamento', '11', '11', '0');
INSERT INTO hospedagens VALUES ('12', 'hotel', '12', '12', '1');
INSERT INTO hospedagens VALUES ('13', 'casa', '13', '13', '1');
INSERT INTO hospedagens VALUES ('14', 'casa', '14', '14', '1');
INSERT INTO hospedagens VALUES ('15', 'apartamento', '15', '15', '0');
INSERT INTO hospedagens VALUES ('16', 'casa', '16', '16', '0');
INSERT INTO hospedagens VALUES ('17', 'apartamento', '17', '17', '1');
INSERT INTO hospedagens VALUES ('18', 'hotel', '18', '18', '0');
INSERT INTO hospedagens VALUES ('19', 'casa', '19', '19', '1');
INSERT INTO hospedagens VALUES ('20', 'casa', '20', '20', '0');

-- Inserindo os dados na alugueis.
INSERT INTO alugueis VALUES ('1', '1', '8450', '2023-07-15', '2023-07-20', '3240');
INSERT INTO alugueis VALUES ('2', '2', '9231', '2023-11-16', '2023-11-23', '6762');
INSERT INTO alugueis VALUES ('3', '3', '6955', '2023-03-21', '2023-03-28', '707');
INSERT INTO alugueis VALUES ('4', '4', '9015', '2022-11-26', '2022-11-28', '1700');
INSERT INTO alugueis VALUES ('5', '5', '2403', '2023-02-16', '2023-02-20', '3044');
INSERT INTO alugueis VALUES ('6', '6', '6090', '2023-09-01', '2023-09-05', '3184');
INSERT INTO alugueis VALUES ('7', '7', '6951', '2023-10-02', '2023-10-03', '859');
INSERT INTO alugueis VALUES ('8', '8', '4372', '2023-04-04', '2023-04-07', '3000');
INSERT INTO alugueis VALUES ('9', '9', '550', '2022-09-12', '2022-09-14', '1380');
INSERT INTO alugueis VALUES ('10', '10', '198', '2022-12-18', '2022-12-21', '2766');
INSERT INTO alugueis VALUES ('11', '11', '3173', '2022-08-08', '2022-08-10', '1436');
INSERT INTO alugueis VALUES ('12', '12', '5112', '2022-07-22', '2022-07-24', '382');
INSERT INTO alugueis VALUES ('13', '13', '4687', '2022-07-16', '2022-07-18', '708');
INSERT INTO alugueis VALUES ('14', '14', '8411', '2023-05-03', '2023-05-09', '1950');
INSERT INTO alugueis VALUES ('15', '15', '3739', '2023-04-12', '2023-04-18', '3108');
INSERT INTO alugueis VALUES ('16', '16', '5784', '2023-03-18', '2023-03-22', '3132');
INSERT INTO alugueis VALUES ('17', '17', '4744', '2022-07-02', '2022-07-09', '2730');
INSERT INTO alugueis VALUES ('18', '18', '5631', '2023-09-06', '2023-09-12', '4164');
INSERT INTO alugueis VALUES ('19', '19', '7062', '2022-12-31', '2023-01-07', '1701');
INSERT INTO alugueis VALUES ('20', '20', '3072', '2023-09-04', '2023-09-05', '475');

-- Inserindo os dados avaliacoes.
INSERT INTO avaliacoes VALUES ('1', '1', '8450', '2', 'Horrível localização.');
INSERT INTO avaliacoes VALUES ('10', '10', '198', '2', 'Horrível atendimento.');
INSERT INTO avaliacoes VALUES ('100', '100', '4019', '2', 'Péssima infraestrutura.');
INSERT INTO avaliacoes VALUES ('1000', '1000', '5108', '3', 'Maravilhosa serviços.');
INSERT INTO avaliacoes VALUES ('10000', '10000', '8802', '3', 'Excelente limpeza.');
INSERT INTO avaliacoes VALUES ('1001', '1001', '3397', '4', 'Ótima atendimento.');
INSERT INTO avaliacoes VALUES ('1002', '1002', '8131', '1', 'Desconfortável limpeza.');
INSERT INTO avaliacoes VALUES ('1003', '1003', '5657', '3', 'Agradável serviços.');
INSERT INTO avaliacoes VALUES ('1004', '1004', '4261', '4', 'Excelente atendimento.');
INSERT INTO avaliacoes VALUES ('1005', '1005', '3210', '5', 'Incrível localização.');
INSERT INTO avaliacoes VALUES ('1006', '1006', '9366', '1', 'Péssima serviços.');
INSERT INTO avaliacoes VALUES ('1007', '1007', '155', '3', 'Incrível serviços.');
INSERT INTO avaliacoes VALUES ('1008', '1008', '4246', '4', 'Maravilhosa localização.');
INSERT INTO avaliacoes VALUES ('1009', '1009', '5233', '5', 'Ótima limpeza.');
INSERT INTO avaliacoes VALUES ('101', '101', '8635', '3', 'Ótima limpeza.');
INSERT INTO avaliacoes VALUES ('1010', '1010', '8621', '2', 'Desagradável limpeza.');
INSERT INTO avaliacoes VALUES ('1011', '1011', '6541', '4', 'Confortável infraestrutura.');
INSERT INTO avaliacoes VALUES ('1012', '1012', '2050', '4', 'Agradável infraestrutura.');
INSERT INTO avaliacoes VALUES ('1013', '1013', '2515', '4', 'Ótima localização.');
INSERT INTO avaliacoes VALUES ('1014', '1014', '9400', '4', 'Maravilhosa infraestrutura.');

-- Conhecendo os dados.
SELECT * FROM alugueis;

SELECT * FROM avaliacoes;

SELECT * FROM clientes;

SELECT * from enderecos;

SELECT * from hospedagens;

SELECT * from proprietarios;