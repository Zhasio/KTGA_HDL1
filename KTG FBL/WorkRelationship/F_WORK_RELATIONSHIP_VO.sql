SELECT 
DATE_FORMAT((SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1),'%Y/%m/%d') as ACCEPTED_TERMINATION_DATE
,0 as ACTION_OCCURRENCE_ID
,
DATE_FORMAT((SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1),'%Y/%m/%d') as ACTUAL_TERMINATION_DATE,
DATE_FORMAT(П.`Дата`,'%Y/%m/%d') as ADJUSTED_SVC_DATE,
'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID,
'' as DATE_EMPLOYEE_DATA_VERIFIED,DATE_FORMAT(П.`Дата`,'%Y/%m/%d') as DATE_START
,'Y' as FAST_PATH_EMPLOYEE
,DATE_FORMAT((SELECT ПЕР.`Дата` - INTERVAL 1 DAY FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1),'%Y/%m/%d') as LAST_WORKING_DATE
,
CASE WHEN П.BU='KTG' THEN '188772AEC11BAD11E053A647660A0CF2'
ELSE '188772AEC11CAD11E053A647660A0CF2' 
END as LEGAL_ENTITY_ID,
'KZ' as LEGISLATION_CODE,
DATE_FORMAT((SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` > П.`Дата`
 
ORDER BY ПЕР.`Дата` LIMIT 1),'%Y/%m/%d') as NOTIFIED_TERMINATION_DATE,
'N' as ON_MILITARY_SERVICE,DATE_FORMAT(П.`Дата`,'%Y/%m/%d') as ORIGINAL_DATE_OF_HIRE,
CONCAT('PERIOD',CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END) as PERIOD_OF_SERVICE_ID,'E' as PERIOD_TYPE,
CONCAT('P',П.PERSON_ID) as PERSON_ID,'Y' as PRIMARY_FLAG,
DATE_FORMAT((SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1),'%Y/%m/%d') as PROJECTED_TERMINATION_DATE,'' as REHIRE_AUTHORIZOR,'' as REHIRE_REASON,
'Y' as REHIRE_RECOMMENDATION,'' as TERMINATION_ACCEPTED_PERSON_ID,'' as WORKER_NUMBER,
'' as COMMENTS,'' as REHIRE_AUTHORIZER_PERSON_ID
,'WR' as FT_ALTERNATE_REC,CONCAT('P',
CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END,'::WR') as FT_ALTERNATE_KEY
FROM prykazy П
WHERE  П.ГруппаПриказа IN(1) AND П.PERSON_ID='3672922075'
ORDER BY П.Дата