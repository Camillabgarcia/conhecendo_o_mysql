-- 04. Filtrando hospedagem.

-- Consulta sobre quais hospedagens são mais bem avaliadas (nota 4 ou 5):

SELECT * FROM avaliacoes
WHERE nota >= 4;

-- Consulta sobre hospedagens do tipo hotel e que estejam ativas:

SELECT * FROM hospedagens
where tipo = 'hotel' AND ativo = 1;

-- Analisando o perfil dos clientes.
-- Consulta sobre a média do que cada cliente gasta na plataforma (ticket médio) com os aluguéis, com as reservas das hospedagens:

SELECT cliente_id, AVG(preco_total) AS Ticket_Médio 
FROM alugueis
GROUP BY cliente_id;

-- Consulta sobre a média de dias de cada reserva por cliente:

SELECT cliente_id,                                             -- Seleciona o identificador do cliente
       AVG(DATEDIFF(data_fim, data_inicio)) AS Media_dias_estadia  -- Calcula a média da diferença de dias entre a data de fim e a data de início de cada reserva
FROM alugueis                                                 -- A consulta é feita sobre a tabela 'alugueis'
GROUP BY cliente_id                                           -- Agrupa os registros pelo identificador do cliente
ORDER BY Media_dias_estadia DESC;                             -- Ordena os resultados pela média de dias de estadia em ordem decrescente

-- Consulta sobre informações dos proprietários que possuem cadastro na plataforma, mostrando os 10 perfis com mais hospedagens ativas:

SELECT p.nome AS Nome_proprietario,                                -- Seleciona o nome do proprietário e renomeia a coluna para 'Nome_proprietario'
       COUNT(h.hospedagem_id) AS Total_de_hospedagens_ativas       -- Conta o total de hospedagens ativas por proprietário e renomeia para 'Total_de_hospedagens_ativas'
FROM proprietarios p                                               -- A consulta é feita na tabela 'proprietarios', com o alias 'p'
JOIN hospedagens h ON h.proprietario_id = p.proprietario_id        -- Realiza uma junção entre 'proprietarios' e 'hospedagens' usando o ID do proprietário
WHERE h.ativo = 1                                                  -- Filtra apenas as hospedagens ativas (hospedagens onde 'ativo' é igual a 1)
GROUP BY Nome_proprietario                                         -- Agrupa os resultados pelo nome do proprietário
ORDER BY Total_de_hospedagens_ativas DESC                         -- Ordena os resultados pelo total de hospedagens ativas em ordem decrescente
LIMIT 10;                                                          -- Limita a exibição aos 10 primeiros proprietários com mais hospedagens ativas

-- Consulta para encontrar o número de hospedagens inativas por proprietário:

SELECT p.nome AS Nome_proprietario,                                  -- Seleciona o nome do proprietário e renomeia a coluna para 'Nome_proprietario'
       COUNT(*) AS Total_de_hospedagens_inativas                    -- Conta o total de hospedagens inativas para cada proprietário e renomeia para 'Total_de_hospedagens_inativas'
FROM proprietarios p                                                 -- A consulta é feita na tabela 'proprietarios', com o alias 'p'
JOIN hospedagens h ON h.proprietario_id = p.proprietario_id          -- Realiza uma junção entre as tabelas 'proprietarios' e 'hospedagens' usando o ID do proprietário
WHERE h.ativo = 0                                                    -- Filtra as hospedagens onde 'ativo' é igual a 0, ou seja, hospedagens inativas
GROUP BY p.nome;                                                     -- Agrupa os resultados pelo nome do proprietário

-- Consulta sobre os meses com maior e menor demanda de alugueis:

SELECT YEAR(data_inicio) AS Ano, 
	   MONTH(data_inicio) AS Mês,
       COUNT(*) AS Total_alugueis
FROM alugueis 
GROUP BY Ano, Mês
ORDER BY Total_alugueis DESC;

       




