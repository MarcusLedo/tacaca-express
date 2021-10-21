USE tacaca_express;

SELECT * FROM unityUnity;

/*Selecionar apenas as unidades administrativas*/

SELECT id, name_unity
FROM Unity
WHERE type_unity = 2;

/*Selecionar funcionários que ainda fazem parte do quadro*/

SELECT id, employee_name
FROM Employee
WHERE IsNull(dismissal_date);

/*Selecionar funcionários com função gratificada vigente*/

SELECT employee.id, employee.employee_name , position_title.position_title, career.start_date
FROM Career
INNER JOIN Employee
ON career.employee_id = employee.id
INNER JOIN Position_Title
ON career.position_title = position_title.id
WHERE IsNull(Career.end_date)
ORDER BY (employee.id);

/*Exibir funcionários da unidade de Belém*/

SELECT employee_name, name_unity
FROM Employee
LEFT JOIN Career
ON employee.id = career.employee_id
LEFT JOIN Unity
ON career.unity = unity.id
WHERE career.unity = 1
AND career.end_date IS NULL
ORDER BY (employee_name);

/*Alteração do nome da unidade de RH*/

UPDATE Unity
SET name_unity = "Gestão de Pessoas"
WHERE unity.id = 32;

/*Alteração do gênero de Pedro Campos*/

UPDATE Employee
SET gender = "M"
WHERE employee.id = 66;

/*Exclusão de Telefone*/
 
 DELETE FROM Phone
 WHERE id  = 4;
 
/*Funcionários com menos de dois anos de empresa*/

SELECT employee_name
FROM Employee
WHERE hiring_date >= CONVERT("2019-10-20", DATE)
AND dismissal_date IS NULL;

/*Mães que não moram em Belém*/

SELECT employee.employee_name
FROM Employee
RIGHT JOIN Address
ON employee.address = address.id
WHERE employee.gender = "F"
AND children > 0
AND NOT address.city = "Belém";

/*Funcionárias que moram em Belém e não são mães*/

SELECT employee.employee_name
FROM Employee
RIGHT JOIN Address
ON employee.address = address.id
WHERE employee.gender = "F"
AND children = 0
AND address.city = "Belém"
ORDER BY (employee.employee_name);