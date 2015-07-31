SELECT 
CASE 
WHEN (((SELECT COUNT(1) FROM prykazy РХ WHERE РХ.PERSON_ID=П.PERSON_ID
 AND РХ.`ГруппаПриказа`=1) > 1)
 AND ( (SELECT MIN(РХ.Дата) FROM prykazy РХ 
 WHERE РХ.PERSON_ID=П.PERSON_ID AND РХ.`ГруппаПриказа`=1) != П.Дата)
  AND (П.ГруппаПриказа=1)) /*Количество Приема Больше 2 значить REHIRE */
THEN 'REHIRE' 
WHEN П.`ГруппаПриказа`=1 
THEN 'HIRE' 
WHEN П.`ГруппаПриказа`=2
THEN 'TRANSFER' 
WHEN П.`ГруппаПриказа`=3
 THEN 'TERMINATION' END AS ACTION_CODE
,'' AS ACTION_OCCURRENCE_ID
, 
CONCAT('ASSIG',
CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID /*Если Приме то указываем AssigmentId текущей записи*/
ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
ORDER BY ПЕР.`Дата` DESC LIMIT 1) /*Иначе Assigment_id Это предующий записи приема*/
END) AS ASSIGNMENT_ID
, CONCAT('ASSIG',CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END) AS ASSIGNMENT_NAME
,'' AS ASSIGNMENT_NUMBER
,(SELECT COUNT(1) FROM prykazy СЕК
 WHERE СЕК.PERSON_ID=П.PERSON_ID 
 AND СЕК.`ГруппаПриказа`=1 AND СЕК.`Дата` <= П.Дата) AS ASSIGNMENT_SEQUENCE /* Количество приемов До текущей записи */
,CASE WHEN П.ГруппаПриказа=3 THEN 'INACTIVE' ELSE 'ACTIVE' /*Если Уволен то Неактивный назначение*/
 END AS ASSIGNMENT_STATUS_TYPE
,CASE WHEN П.ГруппаПриказа=3
THEN '188772AEC26BAD11E053A647660A0CF2'
 ELSE '188772AEC269AD11E053A647660A0CF2' 
 END AS ASSIGNMENT_STATUS_TYPE_ID
,'E' AS ASSIGNMENT_TYPE
 
,'N' AS AUTO_END_FLAG
,'' AS BARGAINING_UNIT_CODE
,'' AS BILLING_TITLE
,'188772AEC11AAD11E053A647660A0CF2' AS BUSINESS_GROUP_ID
,
CASE WHEN П.BU='KTG' THEN 'AO "KazTransGaz" BU'
ELSE 'AO "KazTransGaz Aimak" CA BU'
END
 AS BUSINESS_UNIT_ID
,'' AS CAGR_GRADE_DEF_ID
,'' AS CAGR_ID_FLEX_NUM
,'' AS COLLECTIVE_AGREEMENT_ID
,'' AS CONTRACT_ID
,'' AS DATE_PROBATION_END
,'' AS DEFAULT_CODE_COMB_ID
,'' AS DUTIES_TYPE
,
CASE 
WHEN П.ГруппаПриказа = 1 THEN (SELECT DATE_FORMAT(КН.ДАТА  ,'%Y/%m/%d') FROM prykazy КН 
WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА  > П.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
WHEN П.`ГруппаПриказа`='3' THEN '4712/12/31' /*  Если уволен то Дата конца = до бесконечности 4712/12/31  */
/*WHEN П.`ГруппаПриказа`='2' THEN
( SELECT DATE_FORMAT(КН.ДАТА - INTERVAL 1 DAY ,'%Y/%m/%d') FROM prykazy КН 
WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА  > П.ДАТА   ORDER BY КН.`Дата` LIMIT 1)  /* Если перевод то Дата конца = Дата следующий записи - 1 день */
/*WHEN 
( SELECT КН.ГруппаПриказа 
FROM prykazy КН WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА > П.ДАТА  ORDER BY КН.`Дата` LIMIT 1)='2' 
THEN
( SELECT DATE_FORMAT(КН.ДАТА,'%Y/%m/%d') FROM prykazy КН 
WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА  > П.ДАТА   ORDER BY КН.`Дата` LIMIT 1) 
*/   /* Если следующая запись перевод то Дата конца = Дата следующий записи */
WHEN ( SELECT DATE_FORMAT(КН.ДАТА - INTERVAL 1 DAY,'%Y/%m/%d') 
FROM prykazy КН WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА > П.ДАТА  ORDER BY КН.`Дата` LIMIT 1) IS NOT NULL 
THEN ( SELECT DATE_FORMAT(КН.ДАТА - INTERVAL 1 DAY ,'%Y/%m/%d') FROM prykazy КН 
WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА  > П.ДАТА   ORDER BY КН.`Дата` LIMIT 1)    /* Если  */ 
ELSE '4712/12/31' /*Иначе Дата конца = до бесконечности 4712/12/31 */
 END  AS EFFECTIVE_END_DATE
,'Y' AS EFFECTIVE_LATEST_CHANGE
,'1' AS EFFECTIVE_SEQUENCE
,DATE_FORMAT( CASE WHEN П.ГруппаПриказа=3 THEN ( П.`Дата` + INTERVAL 1 DAY ) ELSE  П.`Дата` END ,'%Y/%m/%d')  AS EFFECTIVE_START_DATE
,'' AS EMPLOYEE_CATEGORY
,'FR' AS EMPLOYMENT_CATEGORY
,'' AS ESTABLISHMENT_ID
,'' AS EXPENSE_CHECK_ADDRESS
,'W' AS FREQUENCY
,'' AS GRADE_ID
,'' AS GRADE_LADDER_PGM_ID
,'' AS HOURLY_SALARIED_CODE
,'' AS INTERNAL_BUILDING
,'' AS INTERNAL_FLOOR
,'' AS INTERNAL_LOCATION
,'' AS INTERNAL_MAILSTOP
,'' AS INTERNAL_OFFICE_NUMBER
, П.JOB_ID AS JOB_ID
,'' AS JOB_POST_SOURCE_NAME
,'N' AS LABOUR_UNION_MEMBER_FLAG
,
CASE WHEN П.BU='KTG' THEN '188772AEC11BAD11E053A647660A0CF2'
ELSE '188772AEC11CAD11E053A647660A0CF2' 
END as LEGAL_ENTITY_ID
,'KZ' AS LEGISLATION_CODE
,'' AS LINKAGE_TYPE
,'BC_BOLASHAK' AS LOCATION_ID
,'' AS MANAGER_FLAG
,40 AS NORMAL_HOURS
,0 AS NOTICE_PERIOD
,'' AS NOTICE_PERIOD_UOM
, П.DEPARTMENT_ID as ORGANIZATION_ID
,'' AS PARENT_ASSIGNMENT_ID
,'' AS PEOPLE_GROUP_ID
, CONCAT('PERIOD',CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM  prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END) AS PERIOD_OF_SERVICE_ID
, CONCAT('P', П.PERSON_ID) AS PERSON_ID
,'188772AEC125AD11E053A647660A0CF2' AS PERSON_TYPE_ID
,'' AS PO_HEADER_ID
,'' AS PO_LINE_ID
,'' AS POSITION_ID
,'Y' AS POSITION_OVERRIDE_FLAG
,'' AS POSTING_CONTENT_ID
,/*CASE WHEN (SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1) THEN 'N' ELSE 'Y' END*/
'Y' AS PRIMARY_ASSIGNMENT_FLAG
,/*CASE WHEN (SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1) THEN 'N' ELSE 'Y' END*/ 
'Y' as PRIMARY_FLAG
,'Y' AS PRIMARY_WORK_RELATION_FLAG
,'' AS PRIMARY_WORK_TERMS_FLAG
,'' AS PROBATION_PERIOD
,'' AS PROBATION_UNIT
,'' AS PROJECT_TITLE
,'' AS PROJECTED_ASSIGNMENT_END
,'' AS PROPOSED_WORKER_TYPE
,CASE WHEN (((SELECT COUNT(1) FROM prykazy РХ 
WHERE РХ.PERSON_ID=П.PERSON_ID AND РХ.`ГруппаПриказа`=1) > 1) 
AND ( (SELECT MIN(РХ.Дата) FROM prykazy РХ WHERE РХ.PERSON_ID=П.PERSON_ID 
AND РХ.`ГруппаПриказа`=1) != П.Дата) AND (П.ГруппаПриказа=1)) THEN 'REHIRE_WKR' 
WHEN П.ГруппаПриказа=1 THEN 'NEWHIRE' WHEN П.ГруппаПриказа=2 THEN 'WORKERREQ' WHEN П.ГруппаПриказа=3 THEN 'CMP_PERF' END AS REASON_CODE
,'' AS RECORD_CREATOR
,0 AS RETIREMENT_AGE
,'' AS RETIREMENT_DATE
,'' AS SAL_REVIEW_PERIOD
,'' AS SAL_REVIEW_PERIOD_FREQUENCY
,'' AS SET_OF_BOOKS_ID
,'' AS SOURCE_TYPE
,'' AS SPECIAL_CEILING_STEP_ID
,'' AS STEP_ENTRY_DATE
,'EMP' AS SYSTEM_PERSON_TYPE
,'' AS TAX_ADDRESS_ID
,'' AS TIME_NORMAL_FINISH
,'' AS TIME_NORMAL_START
,'' AS VENDOR_ASSIGNMENT_NUMBER
,'' AS VENDOR_EMPLOYEE_NUMBER
,'' AS VENDOR_ID
,'' AS VENDOR_SITE_ID
,'' AS WORK_AT_HOME
, 
CONCAT('WT_ASSIG',
CASE WHEN П.`ГруппаПриказа`=1 THEN 
П.ASSIGNMENT_ID
ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END
) AS WORK_TERMS_ASSIGNMENT_ID
,'4712/12/31' AS FREEZE_START_DATE
,'0001/01/01' AS FREEZE_UNTIL_DATE
,'WT' AS FT_ALTERNATE_REC
,
 CONCAT('ASSIG',
CASE WHEN П.`ГруппаПриказа`=1 THEN 
П.ASSIGNMENT_ID
ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END
,'::ASSIGNMENT') AS FT_ALTERNATE_KEY

FROM prykazy П
where П.PERSON_ID='3672922075'
ORDER BY П.PERSON_ID ,П.Дата