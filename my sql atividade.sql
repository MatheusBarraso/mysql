-- 1
SELECT nome_depto, sigla_depto
FROM departamento;

-- 2
SELECT DISTINCT sigla_depto, nome_depto
FROM departamento;

-- 3
SELECT nome_funcionario
FROM funcionario;

-- 4
SELECT DISTINCT nome_funcionario
FROM funcionario;

-- 5
SELECT DISTINCT sigla_projeto, nome_projeto
FROM projeto;

-- 6
SELECT sigla_depto, nome_depto
FROM departamento
WHERE qtdfuncionariosdepto < 11;

-- 7
SELECT sigla_depto, nome_depto
FROM departamento
WHERE qtdfuncionariosdepto >= 15;

-- 8
SELECT nome_funcionario, cargo
FROM funcionario
WHERE sigla_depto = 'TI';

-- 9
SELECT nome_funcionario, cargo
FROM funcionario
ORDER BY nome_funcionario DESC;

-- 10
SELECT nome_depto, sigla_depto
FROM departamento
ORDER BY nome_depto ASC;

-- 11
SELECT nome_projeto, sigla_projeto
FROM projeto
ORDER BY nome_projeto DESC;
