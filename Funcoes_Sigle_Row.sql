-- Fun��es de convers�o Mai�sculo & Min�sculo

SELECT
  employee_id,
  last_name,
  department_id
FROM
  employees
WHERE
  last_name = 'KING';

--UPPER coloca em ma�sculo

SELECT
  employee_id,
  last_name,
  department_id
FROM
  employees
WHERE
  upper(last_name) = 'KING';

-- Fun��es de Manipula��o de Caracteres

--concat junta duas strings
--substr seleciona parte da string
--length pega o tamanho da string
--instr pega a posi��o do in�cio da string
-- dual � banco de linha �nica gerado pelo sistema

SELECT
  concat(' Curso: ', 'Introdu��o ORACLE 19c'),
  substr('Introdu��o ORACLE 19c', 1, 11),
  length('Introdu��o ORACLE 19c'),
  instr('Introdu��o ORACLE 19c', 'ORACLE')
FROM
  dual;

--alinhamento de palavras nas colunas

SELECT
  first_name                "Nome",
  lpad(first_name, 20, ' ') "Nome alinhado a direita",
  rpad(first_name, 20, ' ') "Nome alinhado a esquerda"
FROM
  employees;

--replace substitui uma palavra da sequ�ncia retornada pela consulta

SELECT
  job_title,
  replace(job_title, 'President', 'Presidente') cargo
FROM
  jobs
WHERE
  job_title = 'President';

-- Fun��es tipo NUMBER

--round arredonda as casas, podendo se utilizar a precis�o

SELECT
  round(45.923, 2),
  round(45.923, 0)
FROM
  dual;

--trunc corta as casas sem arredondar

SELECT
  trunc(45.923, 2),
  trunc(45.923, 0)
FROM
  dual;

--mod retorna o resto da divis�o

SELECT
  mod(1300, 600) resto
FROM
  dual;

--abs retorna o valor absoluto no n�mero, transforma negativo em positivo
--sqrt retorna a raiz quadrada do n�mero

SELECT
  abs(- 9),
  sqrt(9)
FROM
  dual;

-- Fun��es tipo DATE 

--sysdate retorna a data do sistema

SELECT
  sysdate
FROM
  dual;

--verifica tabela dual

DESC dual;

SELECT
  *
FROM
  dual;

SELECT
  30000 * 1.25
FROM
  dual;

-- C�lculos com Datas

SELECT
  sysdate,
  sysdate + 30,
  sysdate + 60,
  sysdate - 30
FROM
  dual;

--round arredonda a data

SELECT
  last_name,
  hire_date                           AS "Contrata��o",
  round((sysdate - hire_date) / 7, 0) "SEMANAS DE TRABALHO"
FROM
  employees;

-- Outras Fun��es tipo DATE

SELECT
  first_name
  || ' '
  || last_name                                 AS "Nome",
  hire_date                                    AS "Contrata��o",
  round(months_between(sysdate, hire_date), 0) "Meses de trabalho"
FROM
  employees;

--add_months adiciona meses a data
--next_day informa a data do pr�ximo dia, no exemplo a pr�xima sexta-feira
--last_day informa o �ltima dia do m�s

SELECT
  sysdate,
  add_months(sysdate, 3),
  next_day(sysdate, 'SEXTA FEIRA'),
  last_day(sysdate)
FROM
  dual;

--round arredonda a data considerando o meio do ano ou m�s
--trunc trunca a data ignorando hora minuto e segundo

SELECT
  sysdate,
  round(sysdate, 'MONTH'),
  round(sysdate, 'YEAR'),
  trunc(sysdate, 'MONTH'),
  trunc(sysdate, 'YEAR')
FROM
  dual;

--exemplo sem trunc

SELECT
  sysdate,
  to_char(sysdate, 'DD/MM/YYYY HH24:MI:SS')
FROM
  dual;

--exemplo com trunc

SELECT
  sysdate,
  to_char(trunc(sysdate), 'DD/MM/YYYY HH24:MI:SS')
FROM
  dual;