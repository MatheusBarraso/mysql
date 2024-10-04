-- Criação do banco

create database empresa

-- Criação das tabelas

CREATE TABLE departamento (
    sigla_depto VARCHAR(10) PRIMARY KEY,
    nome_depto VARCHAR(50),
    qtdfuncionariosdepto INT
);

CREATE TABLE funcionario (
    codfuncionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(50),
    cargo VARCHAR(50),
    sigla_depto VARCHAR(10),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto)
);

CREATE TABLE projeto (
    sigla_projeto VARCHAR(10) PRIMARY KEY,
    nome_projeto VARCHAR(100),
    codfuncionario INT,
    sigla_depto VARCHAR(10),
    FOREIGN KEY (codfuncionario) REFERENCES funcionario(codfuncionario),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto)
);


INSERT INTO departamento (sigla_depto, nome_depto, qtdfuncionariosdepto) VALUES
('HR', 'Recursos Humanos', 10),
('IT', 'Tecnologia da Informação', 25),
('FIN', 'Finanças', 15),
('MKT', 'Marketing', 20),
('DEV', 'Desenvolvimento', 30),
('ADM', 'Administração', 12),
('LOG', 'Logística', 8),
('VEND', 'Vendas', 18),
('SUP', 'Suporte', 14),
('R&D', 'Pesquisa e Desenvolvimento', 22);


INSERT INTO funcionario (codfuncionario, nome_funcionario, cargo, sigla_depto) VALUES
(1, 'Alice Pereira', 'Gerente de Recursos Humanos', 'HR'),
(2, 'Bruno Silva', 'Analista de Sistemas', 'IT'),
(3, 'Carlos Mendes', 'Contador', 'FIN'),
(4, 'Diana Costa', 'Coordenadora de Marketing', 'MKT'),
(5, 'Eduardo Lima', 'Desenvolvedor', 'DEV'),
(6, 'Fernanda Rocha', 'Assistente Administrativo', 'ADM'),
(7, 'Gustavo Almeida', 'Analista de Logística', 'LOG'),
(8, 'Helena Martins', 'Representante de Vendas', 'VEND'),
(9, 'Igor Ferreira', 'Técnico de Suporte', 'SUP'),
(10, 'Julia Santos', 'Pesquisadora', 'R&D');


INSERT INTO projeto (sigla_projeto, nome_projeto, codfuncionario, sigla_depto) VALUES
('P1', 'Implementação de Sistema', 2, 'IT'),
('P2', 'Campanha de Marketing', 4, 'MKT'),
('P3', 'Reforma Financeira', 3, 'FIN'),
('P4', 'Desenvolvimento de App', 5, 'DEV'),
('P5', 'Pesquisa de Mercado', 10, 'R&D'),
('P6', 'Otimização de Processos', 7, 'LOG'),
('P7', 'Treinamento de Vendas', 8, 'VEND'),
('P8', 'Suporte Técnico', 9, 'SUP'),
('P9', 'Atualização de Políticas', 1, 'HR'),
('P10', 'Análise de Dados', 2, 'IT');

-- Consultas

-- 1
SELECT sigla_depto, COUNT(*) AS contagem_funcionarios
FROM funcionario
GROUP BY sigla_depto;

-- 2
SELECT sigla_depto
FROM funcionario
GROUP BY sigla_depto
HAVING COUNT(*) > 3;

-- 3
SELECT nome_funcionario, salario
FROM funcionario
ORDER BY salario ASC
LIMIT 3;

-- 4
SELECT f.sigla_depto, GROUP_CONCAT(f.nome_funcionario SEPARATOR '; ') AS nomes_funcionarios
FROM funcionario f
GROUP BY f.sigla_depto;

-- 5
SELECT sigla_depto, COUNT(*) AS contagem_funcionarios
FROM funcionario
GROUP BY sigla_depto
ORDER BY contagem_funcionarios DESC
LIMIT 3;

-- 6
SELECT d.sigla_depto, d.nome_depto, COUNT(f.codfuncionario) AS contagem_funcionarios
FROM departamento d
LEFT JOIN funcionario f ON d.sigla_depto = f.sigla_depto
GROUP BY d.sigla_depto;

-- 7
SELECT f.sigla_depto, COUNT(*) AS contagem_funcionarios
FROM funcionario f
GROUP BY f.sigla_depto
HAVING AVG(f.salario) > 3790;

-- 8

SELECT DISTINCT salario 
FROM funcionario 
ORDER BY salario DESC 
LIMIT 2;

-- 9
SELECT cargo, nome_funcionario 
FROM funcionario f1 
WHERE data_contratacao = (
    SELECT MIN(data_contratacao) 
    FROM funcionario f2 
    WHERE f1.cargo = f2.cargo
);
-- 10
SELECT DISTINCT d.nome_depto 
FROM departamento d
JOIN funcionario f ON d.sigla_depto = f.sigla_depto
WHERE f.salario > 5000;

-- 11
SELECT DISTINCT d.nome_depto 
FROM departamento d
JOIN funcionario f ON d.sigla_depto = f.sigla_depto
WHERE f.salario > (SELECT AVG(salario) FROM funcionario);

-- 12
SELECT DISTINCT d.nome_depto 
FROM departamento d
JOIN funcionario f ON d.sigla_depto = f.sigla_depto
WHERE f.nome_funcionario LIKE '%Costa%';

-- 13
SELECT DISTINCT d.nome_depto 
FROM departamento d
JOIN funcionario f ON d.sigla_depto = f.sigla_depto
WHERE f.salario > (
    SELECT AVG(salario) 
    FROM funcionario 
    WHERE sigla_depto = d.sigla_depto
); 
