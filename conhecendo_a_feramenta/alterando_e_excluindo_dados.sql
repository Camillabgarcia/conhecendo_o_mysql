-- 05. Alterando e excluindo dados

-- Adicionando uma coluna na tabela de proprietários para incluir o número de hospedagens por proprietário:

ALTER TABLE proprietarios
ADD COLUMN Qtd_hospedagens INT;

-- Renomeando a tabela alugueis para reservas:

ALTER TABLE alugueis
RENAME TO reservas;

-- Renomeando uma coluna da tabela reservas: 

ALTER TABLE reservas
RENAME COLUMN aluguel_id 
TO reserva_id;

-- Atualizando os dados de 3 hospagens que foram reativadas:

UPDATE hospedagens
SET ativo = 1
WHERE hospedagem_id IN ('1', '10', '100');

SELECT * FROM hospedagens;

-- Atualizando um e-mail da tabela de proprietarios:

UPDATE proprietarios
SET contato = 'daniela_120@email.com'
WHERE proprietario_id = '1009';

SELECT * FROM proprietarios
WHERE proprietario_id = '1009';

-- Excluindo registro de duas hospedagens específicas que foram desativadas:

-- Como ela é uma chava estrangeira, é necessário excluir nas outras tabelas também antes da principal:
DELETE FROM avaliacoes
WHERE hospedagem_id IN ('10000','1001');

DELETE FROM reservas
WHERE hospedagem_id IN ('10000','1001');

DELETE FROM hospedagens
WHERE hospedagem_id IN ('10000','1001');






