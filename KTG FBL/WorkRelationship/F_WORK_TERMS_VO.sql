SELECT 
CASE WHEN (((SELECT COUNT(1) FROM prykazy РХ WHERE РХ.PERSON_ID=П.PERSON_ID AND РХ.`ГруппаПриказа`=1) > 1) 
AND ( (SELECT MIN(РХ.Дата) FROM prykazy РХ WHERE РХ.PERSON_ID=П.PERSON_ID AND РХ.`ГруппаПриказа`=1) != П.Дата) AND (П.ГруппаПриказа=1)) 
THEN 'REHIRE' WHEN П.`ГруппаПриказа`=1 THEN 'HIRE' WHEN П.`ГруппаПриказа`=2 THEN 'TRANSFER' WHEN П.`ГруппаПриказа`=3 THEN 'TERMINATION' 
END as ACTION_CODE
,
'' as ACTION_OCCURRENCE_ID
,
CONCAT('WT_ASSIG'
,
 CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END) as ASSIGNMENT_ID
,
'' as ASSIGNMENT_NAME
,
'' as ASSIGNMENT_NUMBER
,
(SELECT COUNT(1) FROM prykazy СЕК WHERE СЕК.PERSON_ID=П.PERSON_ID AND СЕК.`ГруппаПриказа`=1 AND СЕК.`Дата` <= П.Дата) as ASSIGNMENT_SEQUENCE
,
CASE WHEN П.ГруппаПриказа=3 THEN 'INACTIVE' ELSE 'ACTIVE' END as ASSIGNMENT_STATUS_TYPE
,
CASE WHEN П.`ГруппаПриказа`=3 THEN '188772AEC26BAD11E053A647660A0CF2' ELSE '188772AEC269AD11E053A647660A0CF2' END as ASSIGNMENT_STATUS_TYPE_ID
,
'ET' as ASSIGNMENT_TYPE
,
'N' as AUTO_END_FLAG
,
'' as BARGAINING_UNIT_CODE
,
'' as BILLING_TITLE
,
'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
,
CASE WHEN П.BU='KTG' THEN 'AO "KazTransGaz" BU'
ELSE 'AO "KazTransGaz Aimak" CA BU'
END
 AS BUSINESS_UNIT_ID
,
'' as CAGR_GRADE_DEF_ID
,
'' as CAGR_ID_FLEX_NUM
,
'' as COLLECTIVE_AGREEMENT_ID
,
'' as CONTRACT_ID
,
'' as DATE_PROBATION_END
,
'' as DEFAULT_CODE_COMB_ID
,
'' as DUTIES_TYPE
,
CASE 
WHEN П.ГруппаПриказа = 1 AND ( SELECT КН.ГруппаПриказа 
FROM prykazy КН WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА > П.ДАТА  ORDER BY КН.`Дата` LIMIT 1)!='2'  THEN (SELECT DATE_FORMAT(КН.ДАТА  ,'%Y/%m/%d') FROM prykazy КН 
WHERE КН.PERSON_ID=П.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) 
AND КН.ДАТА  > П.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
WHEN П.`ГруппаПриказа`='3' THEN '4712/12/31' /*  Если уволен то Дата конца = до бесконечности 4712/12/31  */
WHEN П.`ГруппаПриказа`='2' THEN
( SELECT DATE_FORMAT(КН.ДАТА,'%Y/%m/%d') FROM prykazy КН 
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
,
'Y' as EFFECTIVE_LATEST_CHANGE
,
1 as EFFECTIVE_SEQUENCE
,DATE_FORMAT( CASE WHEN П.ГруппаПриказа=3 THEN ( П.`Дата` + INTERVAL 1 DAY ) ELSE  П.`Дата` END ,'%Y/%m/%d')  AS EFFECTIVE_START_DATE
,
'' as EMPLOYEE_CATEGORY
,
'' as EMPLOYMENT_CATEGORY
,
'' as ESTABLISHMENT_ID
,
'' as EXPENSE_CHECK_ADDRESS
,
'' as FREQUENCY
,
'' as GRADE_ID
,
'' as GRADE_LADDER_PGM_ID
,
'' as HOURLY_SALARIED_CODE
,
'' as INTERNAL_BUILDING
,
'' as INTERNAL_FLOOR
,
'' as INTERNAL_LOCATION
,
'' as INTERNAL_MAILSTOP
,
'' as INTERNAL_OFFICE_NUMBER
,
'' as JOB_ID
,
'' as JOB_POST_SOURCE_NAME
,
'' as LABOUR_UNION_MEMBER_FLAG
,
CASE WHEN П.BU='KTG' THEN '188772AEC11BAD11E053A647660A0CF2'
ELSE '188772AEC11CAD11E053A647660A0CF2' 
END as LEGAL_ENTITY_ID
,
'KZ' as LEGISLATION_CODE
,
'' as LINKAGE_TYPE
,
'' as LOCATION_ID
,
'' as MANAGER_FLAG
,
'' as NORMAL_HOURS
,
'' as NOTICE_PERIOD
,
'' as NOTICE_PERIOD_UOM
,
'' as ORGANIZATION_ID
,
'' as PARENT_ASSIGNMENT_ID
,
'' as PEOPLE_GROUP_ID
,
CONCAT('PERIOD'
,
CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy  ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END)  as PERIOD_OF_SERVICE_ID
,
CONCAT('P'
,
 П.PERSON_ID) as PERSON_ID
,
'' as PERSON_TYPE_ID
,
'' as PO_HEADER_ID
,
'' as PO_LINE_ID
,
'' as POSITION_ID
,
'Y' as POSITION_OVERRIDE_FLAG
,
'' as POSTING_CONTENT_ID
,
/*CASE WHEN (SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1) THEN 'N' ELSE 'Y' END */
'N' as PRIMARY_ASSIGNMENT_FLAG
,
/*CASE WHEN (SELECT ПЕР.`Дата` FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=3 AND ПЕР.`КодСотрудника`=П.`КодСотрудника` 
AND ПЕР.`Дата` > П.`Дата`
ORDER BY ПЕР.`Дата` LIMIT 1) THEN 'N' ELSE 'Y' END*/
'N' as PRIMARY_FLAG
,
'Y' as PRIMARY_WORK_RELATION_FLAG
,
'N' as PRIMARY_WORK_TERMS_FLAG
,
'' as PROBATION_PERIOD
,
'' as PROBATION_UNIT
,
'' as PROJECT_TITLE
,
'' as PROJECTED_ASSIGNMENT_END
,
'' as PROPOSED_WORKER_TYPE
,
CASE WHEN (((SELECT COUNT(1) FROM prykazy РХ WHERE РХ.PERSON_ID=П.PERSON_ID AND РХ.`ГруппаПриказа`=1) > 1) AND ( (SELECT MIN(РХ.Дата) FROM prykazy РХ WHERE РХ.PERSON_ID=П.PERSON_ID AND РХ.`ГруппаПриказа`=1) != П.Дата) AND (П.ГруппаПриказа=1)) THEN 'REHIRE_WKR' WHEN П.`ГруппаПриказа`=1 THEN 'NEWHIRE' WHEN П.`ГруппаПриказа`=2 THEN 'WORKERREQ' WHEN П.`ГруппаПриказа`=3 THEN 'CMP_PERF' END as REASON_CODE
,
'' as RECORD_CREATOR
,
'' as RETIREMENT_AGE
,
'' as RETIREMENT_DATE
,
'' as SAL_REVIEW_PERIOD
,
'' as SAL_REVIEW_PERIOD_FREQUENCY
,
'' as SET_OF_BOOKS_ID
,
'' as SOURCE_TYPE
,
'' as SPECIAL_CEILING_STEP_ID
,
'' as STEP_ENTRY_DATE
,
'EMP' as SYSTEM_PERSON_TYPE
,
'' as TAX_ADDRESS_ID
,
'' as TIME_NORMAL_FINISH
,
'' as TIME_NORMAL_START
,
'' as VENDOR_ASSIGNMENT_NUMBER
,
'' as VENDOR_EMPLOYEE_NUMBER
,
'' as VENDOR_ID
,
'' as VENDOR_SITE_ID
,
'' as WORK_AT_HOME
,
'' as WORK_TERMS_ASSIGNMENT_ID
,
'4712/12/31' as FREEZE_START_DATE
,
'0001/01/01' as FREEZE_UNTIL_DATE
,
'WT' as FT_ALTERNATE_REC
,
CONCAT('WT_ASSIG'
,
 CASE WHEN П.`ГруппаПриказа`=1 THEN П.ASSIGNMENT_ID ELSE
(SELECT ПЕР.ASSIGNMENT_ID FROM prykazy ПЕР
WHERE ПЕР.ГруппаПриказа=1 AND ПЕР.PERSON_ID=П.PERSON_ID AND ПЕР.`Дата` < П.`Дата`
 
ORDER BY ПЕР.`Дата` DESC LIMIT 1)
END
,
'::WorkTerm') as FT_ALTERNATE_KEY
FROM prykazy П 
WHERE  П.ГруппаПриказа IN(1,2,3) AND П.PERSON_ID='3672922075'
ORDER BY П.Дата