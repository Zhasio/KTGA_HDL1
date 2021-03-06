SELECT CONCAT('POS_',CRC32(UPPER(Д.`Наименование`))) AS POSITION_ID,
CASE WHEN ДИ.`ДатаНач` IS NOT NULL THEN DATE_FORMAT(ДИ.`ДатаНач`,'%Y-%m-%d') ELSE '2000-03-09' END as EFFECTIVE_START_DATE,
CASE WHEN ДИ.`ДатаКон` IS NOT NULL THEN DATE_FORMAT(ДИ.`ДатаКон`,'%Y-%m-%d') ELSE '4712-12-31' END AS EFFECTIVE_END_DATE,
'AO "KazTransGaz Aimak" CA BU' AS BUSINESS_UNIT_ID,
 CONCAT('POS_',CRC32(UPPER(Д.`Наименование`))) AS POSITION_CODE,
'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID,
 CONCAT('DEP_',CRC32(UPPER(П.`Наименование`))) AS ORGANIZATION_ID,
 CONCAT('JOB_',CRC32(UPPER(Д.`Наименование`))) AS JOB_ID,
'BC_BOLASHAK' AS LOCATION_ID,
'' AS ENTRY_GRADE_ID,
'' AS ENTRY_STEP_ID,
CASE WHEN (CASE WHEN ДИ.`Состояние` IS NOT NULL THEN ДИ.`Состояние` ELSE Д.`Состояние` END)=1 THEN 'A' ELSE 'I' END as ACTIVE_STATUS,
'' AS SUPERVISOR_ID,
'' AS SUPERVISOR_ASSIGNMENT_ID,
'' AS ACTION_OCCURRENCE_ID,
'R' AS PERMANENT_TEMPORARY_FLAG,
1 AS FTE,
'APPROVED' AS HIRING_STATUS,
'FULL_TIME' AS FULL_PART_TIME,
'W' AS FREQUENCY,
'' AS TIME_NORMAL_START,
'' AS TIME_NORMAL_FINISH,
CASE WHEN Д.`ПоШтату`<2 OR Д.`ПоШтату` IS NULL THEN 'SINGLE'
ELSE'POOLED' END AS POSITION_TYPE,
'' AS PROBATION_PERIOD_UNIT_CD,
'' AS BARGAINING_UNIT_CD,
CASE WHEN Д.`ПоШтату` IS NOT NULL THEN Д.`ПоШтату` ELSE 1 END AS MAX_PERSONS,
'40' AS WORKING_HOURS,
'' AS OVERLAP_ALLOWED,
'N' AS SEASONAL_FLAG,
'' AS PROBATION_PERIOD,
'' AS SEASONAL_END_DATE,
'' AS SECURITY_CLEARANCE,
'' AS SEASONAL_START_DATE,
'' AS ATTRIBUTE_CATEGORY,
 CONCAT(Д.`Наименование`,' ',П.`Наименование`) AS NAME,
'POSITION_DATA' AS FT_ALTERNATE_REC,
 CONCAT('POS_',CRC32(UPPER(Д.`Наименование`))) AS FT_ALTERNATE_KEY
FROM `Должности` Д
JOIN `Подразделения` П ON Д.`КодПодразделения`=П.`КодПодразделения`
LEFT JOIN `ДолжностиИстория` ДИ
ON Д.`КодДолжности`=ДИ.`КодДолжности` 
WHERE Д.`Состояние`=1