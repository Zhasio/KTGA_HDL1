SELECT ALLS.* FROM
(

SELECT 
'' AS ACTION_OCCURRENCE_ID

, CONCAT('ASSIG',(

SELECT CASE WHEN К.`ГруппаПриказа`=1 THEN К.ASSIGNMENT_ID ELSE

(
SELECT ПЕР.ASSIGNMENT_ID
FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=К.PERSON_ID AND ПЕР.`Дата` < К.`Дата`
GROUP BY ПЕР.`КодСтатьи1`,ПЕР.`КодСотрудника`,ПЕР.`КодДолжности`
ORDER BY ПЕР.`Дата` DESC
LIMIT 1) END AS DAS

FROM prykazy К
WHERE К.PERSON_ID=С.PERSON_ID AND К.`ГруппаПриказа` IN (1,2)
ORDER BY К.`Дата` DESC
LIMIT 1)

) AS ASSIGNMENT_ID

, CONCAT('ASSIG',(
SELECT CASE WHEN К.`ГруппаПриказа`=1 THEN К.ASSIGNMENT_ID ELSE
(
SELECT ПЕР.ASSIGNMENT_ID
FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=К.PERSON_ID AND ПЕР.`Дата` < К.`Дата`
GROUP BY ПЕР.`КодСтатьи1`,ПЕР.`КодСотрудника`,ПЕР.`КодДолжности`
ORDER BY ПЕР.`Дата` DESC
LIMIT 1) END AS ASD
FROM prykazy К
WHERE К.PERSON_ID=Р.PERSON_ID AND К.`ГруппаПриказа` IN (1,2)
ORDER BY   К.`Дата` DESC
LIMIT 1)) AS ASSIGNMENT_SUPERVISOR_ID

,'188772AEC11AAD11E053A647660A0CF2' AS BUSINESS_GROUP_ID

,'4712/12/31' AS EFFECTIVE_END_DATE
, 

DATE_FORMAT((
SELECT К.Дата
FROM prykazy К
WHERE К.PERSON_ID=С.PERSON_ID AND К.`ГруппаПриказа` IN (1,2)
ORDER BY  К.`Дата` DESC
LIMIT 1),'%Y/%m/%d') AS EFFECTIVE_START_DATE

,

 CONCAT('ASSIG',(
SELECT CASE WHEN К.`ГруппаПриказа`=1 THEN К.ASSIGNMENT_ID ELSE
(
SELECT ПЕР.ASSIGNMENT_ID
FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=К.PERSON_ID AND ПЕР.`Дата` < К.`Дата`
GROUP BY ПЕР.`КодСтатьи1`,ПЕР.`КодСотрудника`,ПЕР.`КодДолжности`
ORDER BY ПЕР.`Дата` DESC
LIMIT 1) END AS QW
FROM prykazy К
WHERE К.PERSON_ID=Р.PERSON_ID AND К.`ГруппаПриказа` IN (1,2)
ORDER BY   К.`Дата` DESC
LIMIT 1)) AS MANAGER_ASSIGNMENT_ID

,
 CONCAT('P',Р.PERSON_ID) AS MANAGER_ID

,'LINE_MANAGER' AS MANAGER_TYPE

, CONCAT('P',С.PERSON_ID) AS PERSON_ID
,'Y' AS PRIMARY_FLAG
,'' AS FT_ALTERNATE_REC
,'' AS FT_ALTERNATE_KEY
FROM line_manager lm
LEFT JOIN allperson С ON lm.employee=С.`ФИО`
LEFT JOIN allperson Р ON lm.manager=Р.`ФИО`
) ALLS
WHERE ALLS.ASSIGNMENT_ID IS NOT NULL AND ALLS.ASSIGNMENT_SUPERVISOR_ID IS NOT NULL 