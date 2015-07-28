SELECT 
'' AS ACTION_OCCURRENCE_ID
, CONCAT('ASSIG',(
SELECT CASE WHEN К.`ГруппаПриказа`=1 THEN К.`КодПриказа` ELSE
(
SELECT ПЕР.`КодПриказа`
FROM Приказы ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.`КодСотрудника`=К.`КодСотрудника` AND ПЕР.`Дата` < К.`Дата`
GROUP BY ПЕР.`КодСтатьи1`,ПЕР.`КодСотрудника`,ПЕР.`КодДолжности`
ORDER BY ПЕР.`Дата` DESC
LIMIT 1) END AS DAS
FROM Приказы К
WHERE К.`КодСотрудника`=С.`КодСотрудника` AND К.`ГруппаПриказа` IN (1,2)
ORDER BY К.`ГруппаПриказа` DESC, К.`Дата` DESC
LIMIT 1)) AS ASSIGNMENT_ID
, CONCAT('ASSIG',(
SELECT CASE WHEN К.`ГруппаПриказа`=1 THEN К.`КодПриказа` ELSE
(
SELECT ПЕР.`КодПриказа`
FROM Приказы ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.`КодСотрудника`=К.`КодСотрудника` AND ПЕР.`Дата` < К.`Дата`
GROUP BY ПЕР.`КодСтатьи1`,ПЕР.`КодСотрудника`,ПЕР.`КодДолжности`
ORDER BY ПЕР.`Дата` DESC
LIMIT 1) END AS ASD
FROM Приказы К
WHERE К.`КодСотрудника`=Р.`КодСотрудника` AND К.`ГруппаПриказа` IN (1,2)
ORDER BY К.`ГруппаПриказа` DESC, К.`Дата` DESC
LIMIT 1)) AS ASSIGNMENT_SUPERVISOR_ID
,'11A3CAC8E20AB4E6E053A747660AF6EC' AS BUSINESS_GROUP_ID
,'4712-12-31' AS EFFECTIVE_END_DATE
, DATE_FORMAT((
SELECT К.Дата
FROM Приказы К
WHERE К.`КодСотрудника`=С.`КодСотрудника` AND К.`ГруппаПриказа` IN (1,2)
ORDER BY К.`ГруппаПриказа` DESC, К.`Дата` DESC
LIMIT 1),'%Y-%m-%d') AS EFFECTIVE_START_DATE
, CONCAT('ASSIG',(
SELECT CASE WHEN К.`ГруппаПриказа`=1 THEN К.`КодПриказа` ELSE
(
SELECT ПЕР.`КодПриказа`
FROM Приказы ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.`КодСотрудника`=К.`КодСотрудника` AND ПЕР.`Дата` < К.`Дата`
GROUP BY ПЕР.`КодСтатьи1`,ПЕР.`КодСотрудника`,ПЕР.`КодДолжности`
ORDER BY ПЕР.`Дата` DESC
LIMIT 1) END AS QW
FROM Приказы К
WHERE К.`КодСотрудника`=Р.`КодСотрудника` AND К.`ГруппаПриказа` IN (1,2)
ORDER BY К.`ГруппаПриказа` DESC, К.`Дата` DESC
LIMIT 1)) AS MANAGER_ASSIGNMENT_ID
, CONCAT('P',Р.`КодСотрудника`) AS MANAGER_ID
,'LINE_MANAGER' AS MANAGER_TYPE
, CONCAT('P',С.`КодСотрудника`) AS PERSON_ID
,'Y' AS PRIMARY_FLAG
,'' AS FT_ALTERNATE_REC
,'' AS FT_ALTERNATE_KEY
FROM line_managers lm
LEFT JOIN `Сотрудники` С ON lm.employee=С.`ФИО`
LEFT JOIN `Сотрудники` Р ON lm.manager=Р.`ФИО`