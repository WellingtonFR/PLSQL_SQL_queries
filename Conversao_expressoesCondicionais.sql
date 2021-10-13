-- Utilizando a Função TO_CHAR com Datas
--to_char converte em string
SELECT
  last_name,
  TO_CHAR(hire_date, 'DD/MM/YYYY  HH24:MI:SS') DT_ADMISSÃO
FROM
  employees;

SELECT
  sysdate,
  TO_CHAR(sysdate, 'DD/MM/YYYY  HH24:MI:SS') DATA
FROM
  dual;

SELECT
  last_name,
  TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM
  employees;

SELECT
  last_name,
  TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM
  employees;

-- Utilizando a Função TO_CHAR com Números
SELECT
  first_name,
  last_name,
  TO_CHAR(salary, 'L99G999G999D99') SALÁRIO
FROM
  employees;

SELECT
  first_name,
  last_name,
  TO_CHAR(salary, 'L99G999G999D99') SALÁRIO
FROM
  employees;

-- Utilizando a Função TO_NUMBER
--to_number converte em números
SELECT
  TO_NUMBER('12000,50')
FROM
  dual;

-- Utilizando a Função TO_DATE
--to_date converte em datas
SELECT
  TO_DATE('06/02/2020', 'DD/MM/YYYY') DATA
FROM
  dual;

SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  hire_date = TO_DATE('17/06/2003', 'DD/MM/YYYY');

-- Utilizando Funções Aninhadas
--round arredonda os valores
SELECT
  first_name,
  last_name,
  ROUND(MONTHS_BETWEEN(SYSDATE, hire_date), 0) NUMERO_MESES
FROM
  employees
WHERE
  hire_date = TO_DATE('17/06/2003', 'DD/MM/YYYY');

-- Utilizando a Função NVL
--nvl se o valor for nulo substitui pela segunda expressão
SELECT
  last_name,
  salary,
  NVL(commission_pct, 0),
  salary * 12 SALÁRIO_ANUAL,
  (salary * 12) + (salary * 12 * NVL(commission_pct, 0)) REMUNERACAO_ANUAL
FROM
  employees;

-- Utilizando a Função COALESCE
--coalesce pega o primeiro valor não nulo
SELECT
  COALESCE(NULL, NULL, 'ExpresssÃo 3'),
  COALESCE(NULL, 'ExpressÃo 2', 'ExpresssÃo 3'),
  COALESCE('ExpressÃo 1', 'ExpressÃo 2', 'ExpresssÃo 3')
FROM
  dual;

SELECT
  last_name,
  employee_id,
  commission_pct,
  manager_id,
  COALESCE(
    TO_CHAR(commission_pct),
    TO_CHAR(manager_id),
    'Sem percentual de comissÃo e sem gerente'
  )
FROM
  employees;

-- Utilizando a Função NVL2
--nlv2 funciona como um if, se o valor for nulo usa a segunda expressão, senão usa a primeira
SELECT
  last_name,
  salary,
  commission_pct,
  NVL2(commission_pct, 10, 0) PERCENTUAL_ATERADO
FROM
  employees;

-- Utilizando a Função NULLIF
SELECT
  NULLIF(1000, 1000),
  NULLIF(1000, 2000)
FROM
  dual;

SELECT
  first_name,
  last_name,
  LENGTH(first_name) "ExpressÃo 1",
  LENGTH(last_name) "ExpressÃo 2",
  NULLIF(LENGTH(first_name), LENGTH(last_name)) RESULTADO
FROM
  employees;

-- ExpressÃo CASE
SELECT
  last_name,
  job_id,
  salary,
  CASE
    job_id
    WHEN 'IT_PROG' THEN 1.10 * salary
    WHEN 'ST_CLERK' THEN 1.15 * salary
    WHEN 'SA_REP' THEN 1.20 * salary
    ELSE salary
  END "NOVO SALÁRIO"
FROM
  employees;

-- Utilizando a Função DECODE
SELECT
  last_name,
  job_id,
  salary,
  DECODE(
    job_id,
    'IT_PROG',
    1.10 * salary,
    'ST_CLERK',
    1.15 * salary,
    'SA_REP',
    1.20 * salary,
    salary
  ) "NOVO SALÁRIO"
FROM
  employees;