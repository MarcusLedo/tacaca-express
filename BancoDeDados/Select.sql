USE tacaca_express;

SELECT * FROM unityUnity;

/*Selecionar apenas as unidades administrativas*/
SELECT id, name_unity
FROM Unity
WHERE type_unity = 2;

/*Selecionar empregados que ainda fazem parte do quadro*/
SELECT id, employee_name
FROM Employee
WHERE IsNull(dismissal_date);

/*Selecionar empregados com função gratificada vigente*/

SELECT employee.id, employee.employee_name , position_title.position_title, career.start_date
FROM Career
INNER JOIN Employee
ON career.employee_id = employee.id
INNER JOIN Position_Title
ON career.position_title = position_title.id
WHERE IsNull(Career.end_date);
