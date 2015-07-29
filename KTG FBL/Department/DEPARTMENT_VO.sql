SELECT ALLDEPARTMENTS.* FROM (SELECT KTG.* FROM ( 
SELECT T.* FROM
(
SELECT  CONCAT('KTG_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) as ORGANIZATION_ID,
DATE_FORMAT(
CASE 
WHEN (SELECT MIN(ПР.`Дата`) FROM prykazy ПР WHERE ПР.DEPARTMENT_ID=CONCAT('KTG_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) LIMIT 1)<П.Дата
THEN (SELECT MIN(ПР.`Дата`) FROM prykazy ПР WHERE ПР.DEPARTMENT_ID=CONCAT('KTG_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) LIMIT 1)
WHEN (SELECT MIN(`ПЗИ`.ДатаНач) FROM  kontrotenko_ktg.`ПодразделенияИстория` ПЗИ WHERE CRC32(UPPER(TRIM(ПЗИ.`НаименованиеИстория`)))=CRC32(UPPER(TRIM(П.`Наименование`))) ORDER BY `ПЗИ`.ДатаНач LIMIT 1 )<П.Дата 
THEN (SELECT MIN(`ПЗИ`.ДатаНач) FROM  kontrotenko_ktg.`ПодразделенияИстория` ПЗИ WHERE CRC32(UPPER(TRIM(ПЗИ.`НаименованиеИстория`)))=CRC32(UPPER(TRIM(П.`Наименование`))) ORDER BY `ПЗИ`.ДатаНач LIMIT 1) 
WHEN П.`Дата` IS NOT NULL 
THEN П.`Дата`
ELSE '2000-03-08 00:00:00' END
,'%Y/%m/%d')  as EFFECTIVE_START_DATE,
DATE_FORMAT(
CASE 
WHEN П.`Состояние`='1' THEN '4712-12-31 00:00:00' 
WHEN П.`Состояние`='2'  
THEN 
(
SELECT MAX(ПС.EFFECTIVE_END_DATE) + INTERVAL 1 DAY 
FROM (
	     SELECT ПРД.`Дата`   AS EFFECTIVE_START_DATE
			,CASE 
 
			
			WHEN ПРД.`ГруппаПриказа`='2' 
			THEN ( SELECT  КН.ДАТА FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			
			WHEN ( SELECT КН.ГруппаПриказа FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1)='2' 
			THEN ( SELECT  КН.ДАТА  FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			WHEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1) IS NOT NULL 
			THEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY   FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1) ELSE ПРД.`Дата`
			 END  AS EFFECTIVE_END_DATE
			,
			ПРД.DEPARTMENT_ID
			,
			CASE WHEN ПРД.ГруппаПриказа='3' THEN 'INACTIVE' ELSE 'ACTIVE' END as 'STATUS'
			FROM prykazy ПРД
			WHERE  ПРД.ГруппаПриказа IN (1,2) 
		 ) ПС
		 WHERE ПС.DEPARTMENT_ID=CONCAT('KTG_DEP_',CRC32(UPPER(TRIM(П.`Наименование`))))
)
ELSE '4712-12-31 00:00:00' END
,'%Y/%m/%d') as EFFECTIVE_END_DATE,
CONCAT('КТГ ',TRIM(П.`Наименование`)) as NAME,
 'BC_BOLASHAK' as LOCATION_ID,
 '188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID,
 '19B73EDCB32C8603E053A647660A5518' as SET_ID,
 '' as LEGAL_ENTITY_ID,
 '' as ESTABLISHMENT_ID,
 '' as COST_ALLOCATION_KEYFLEX_ID,
 '' as ACTION_OCCURENCE_ID,
 'A'  as STATUS,
 'INT' as INTERNAL_EXTERNAL_FLAG,
 '' as INTERNAL_ADDRESS_LINE,
 '' as ORGANIZATION_TYPE,
 '' as ATTRIBUTE_CATEGORY,
 '' as ATTRIBUTE1,
 '' as ATTRIBUTE2,
 '' as ATTRIBUTE3,
 '' as ATTRIBUTE4,
 '' as ATTRIBUTE5,
'' as ATTRIBUTE6,
'' as ATTRIBUTE7,
'' as ATTRIBUTE8,
'' as ATTRIBUTE9,
'' as ATTRIBUTE10,
'' as ATTRIBUTE11,
'' as ATTRIBUTE12,
'' as ATTRIBUTE13,
'' as ATTRIBUTE14,
'' as ATTRIBUTE15,
'' as ATTRIBUTE16,
'' as ATTRIBUTE17,
'' as ATTRIBUTE18,
'' as ATTRIBUTE19,
'' as ATTRIBUTE20,
'' as ATTRIBUTE21,
'' as ATTRIBUTE22,
'' as ATTRIBUTE23,
'' as ATTRIBUTE24,
'' as ATTRIBUTE25,
'' as ATTRIBUTE26,
'' as ATTRIBUTE27,
'' as ATTRIBUTE28,
'' as ATTRIBUTE29,
'' as ATTRIBUTE30,
'US' as SOURCE_LANG,
'' as ACTION_OCCURRENCE_ID1,
'DEPARTMENT' as CLASSIFICATION_CODE,
'' as LEGISLATION_CODE,
'DEPT_TBL' as FT_ALTERNATE_REC,
CONCAT('KTG_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) as FT_ALTERNATE_KEY
FROM kontrotenko_ktg.`Подразделения` П
GROUP BY CRC32(UPPER(TRIM(П.`Наименование`)))
) T 
UNION ALL
SELECT T.* FROM
(
SELECT  CONCAT('KTG_DEP_',CRC32(UPPER(TRIM(ПЗ.`Наименование`)))) as ORGANIZATION_ID,
DATE_FORMAT(
CASE 
WHEN ПЗ.`Состояние`='1' THEN '4712-12-31 00:00:00' 
WHEN ПЗ.`Состояние`='2'  
THEN 
(
SELECT MAX(ПС.EFFECTIVE_END_DATE) + INTERVAL 1 DAY 
FROM (
	     SELECT ПРД.`Дата`   AS EFFECTIVE_START_DATE
			,CASE 
 
			
			WHEN ПРД.`ГруппаПриказа`='2' 
			THEN ( SELECT  КН.ДАТА FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			
			WHEN ( SELECT КН.ГруппаПриказа FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1)='2' 
			THEN ( SELECT  КН.ДАТА  FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			WHEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1) IS NOT NULL 
			THEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY   FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1) ELSE ПРД.`Дата`
			 END  AS EFFECTIVE_END_DATE
			,
			ПРД.DEPARTMENT_ID
			,
			CASE WHEN ПРД.ГруппаПриказа='3' THEN 'INACTIVE' ELSE 'ACTIVE' END as 'STATUS'
			FROM prykazy ПРД
			WHERE  ПРД.ГруппаПриказа IN (1,2) 
		 ) ПС
		 WHERE ПС.DEPARTMENT_ID=CONCAT('KTG_DEP_',CRC32(UPPER(TRIM(ПЗ.`Наименование`))))
)
ELSE '4712-12-31 00:00:00' END
,'%Y/%m/%d') as EFFECTIVE_START_DATE,
 '4712/12/31' as EFFECTIVE_END_DATE,
CONCAT('КТГ ',TRIM(ПЗ.`Наименование`)) as NAME,
'BC_BOLASHAK' as LOCATION_ID,
 '188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID,
 '19B73EDCB32C8603E053A647660A5518' as SET_ID,
'' as LEGAL_ENTITY_ID,
'' as ESTABLISHMENT_ID,
'' as COST_ALLOCATION_KEYFLEX_ID,
'' as ACTION_OCCURENCE_ID,
'I' as STATUS,
'INT' as INTERNAL_EXTERNAL_FLAG,
'' as INTERNAL_ADDRESS_LINE,
'' as ORGANIZATION_TYPE,
'' as ATTRIBUTE_CATEGORY,
'' as ATTRIBUTE1,
'' as ATTRIBUTE2,
'' as ATTRIBUTE3,
'' as ATTRIBUTE4,
'' as ATTRIBUTE5,
'' as ATTRIBUTE6,
'' as ATTRIBUTE7,
'' as ATTRIBUTE8,
'' as ATTRIBUTE9,
'' as ATTRIBUTE10,
'' as ATTRIBUTE11,
'' as ATTRIBUTE12,
'' as ATTRIBUTE13,
'' as ATTRIBUTE14,
'' as ATTRIBUTE15,
'' as ATTRIBUTE16,
'' as ATTRIBUTE17,
'' as ATTRIBUTE18,
'' as ATTRIBUTE19,
'' as ATTRIBUTE20,
'' as ATTRIBUTE21,
'' as ATTRIBUTE22,
'' as ATTRIBUTE23,
'' as ATTRIBUTE24,
'' as ATTRIBUTE25,
'' as ATTRIBUTE26,
'' as ATTRIBUTE27,
'' as ATTRIBUTE28,
'' as ATTRIBUTE29,
'' as ATTRIBUTE30,
'US' as SOURCE_LANG,
'' as ACTION_OCCURRENCE_ID1,
'DEPARTMENT' as CLASSIFICATION_CODE,
'' as LEGISLATION_CODE,
'DEPT_TBL' as FT_ALTERNATE_REC,
CONCAT('KTG_DEP_', CRC32(UPPER(TRIM(ПЗ.`Наименование`)))) as FT_ALTERNATE_KEY
FROM kontrotenko_ktg.`Подразделения` ПЗ
WHERE ПЗ.Состояние!='1' AND   (SELECT MAX(ПИ.`ДатаКон`) FROM kontrotenko_ktg.`ПодразделенияИстория` ПИ WHERE CRC32(UPPER(TRIM(ПИ.`НаименованиеИстория`)))=CRC32(UPPER(TRIM(ПЗ.`Наименование`)))) IS NOT NULL 
GROUP BY CRC32(UPPER(TRIM(ПЗ.`Наименование`)))
) T
) KTG

UNION ALL

SELECT KTGA.* FROM ( 
SELECT T.* FROM
(
SELECT  CONCAT('KTGA_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) as ORGANIZATION_ID,
DATE_FORMAT(
CASE 
WHEN (SELECT MIN(ПР.`Дата`) FROM prykazy ПР WHERE ПР.DEPARTMENT_ID=CONCAT('KTGA_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) LIMIT 1)<П.Дата
THEN (SELECT MIN(ПР.`Дата`) FROM prykazy ПР WHERE ПР.DEPARTMENT_ID=CONCAT('KTGA_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) LIMIT 1)
WHEN (SELECT `ПЗИ`.ДатаНач FROM  kontrotenko_ktga.`ПодразделенияИстория` ПЗИ WHERE CRC32(UPPER(TRIM(ПЗИ.`НаименованиеИстория`)))=CRC32(UPPER(TRIM(П.`Наименование`))) ORDER BY `ПЗИ`.ДатаНач LIMIT 1 )<П.Дата THEN (SELECT `ПЗИ`.ДатаНач FROM  kontrotenko_ktga.`ПодразделенияИстория` ПЗИ WHERE CRC32(UPPER(TRIM(ПЗИ.`НаименованиеИстория`)))=CRC32(UPPER(TRIM(П.`Наименование`))) ORDER BY `ПЗИ`.ДатаНач LIMIT 1) WHEN П.`Дата` IS NOT NULL THEN П.`Дата` ELSE '2000-03-08 00:00:00' END
,'%Y/%m/%d')  as EFFECTIVE_START_DATE,
DATE_FORMAT(
CASE
WHEN П.Состояние=1 THEN '4712-12-31 00:00:00' 
WHEN П.Состояние=2  
THEN 
(
SELECT MAX(ПС.EFFECTIVE_END_DATE) + INTERVAL 1 DAY 
FROM (
	     SELECT ПРД.`Дата`   AS EFFECTIVE_START_DATE
			,CASE 			
			WHEN ПРД.`ГруппаПриказа`='2' 
			THEN ( SELECT  КН.ДАТА FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			
			WHEN ( SELECT КН.ГруппаПриказа FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1)='2' 
			THEN ( SELECT  КН.ДАТА  FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			WHEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1) IS NOT NULL 
			THEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY   FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1) ELSE ПРД.`Дата`
			 END  AS EFFECTIVE_END_DATE
			,
			ПРД.DEPARTMENT_ID
			,
			CASE WHEN ПРД.ГруппаПриказа='3' THEN 'INACTIVE' ELSE 'ACTIVE' END as 'STATUS'
			FROM prykazy ПРД
			WHERE  ПРД.ГруппаПриказа IN (1,2) 
		 ) ПС
		 WHERE ПС.DEPARTMENT_ID=CONCAT('KTGA_DEP_',CRC32(UPPER(TRIM(П.`Наименование`))))
)
ELSE '4712-12-31 00:00:00' END
,'%Y/%m/%d') as EFFECTIVE_END_DATE,
 CONCAT('КТГА ',TRIM(П.`Наименование`)) as NAME,
 'BC_BOLASHAK' as LOCATION_ID,
 '188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID,
 '188772AEC119AD11E053A647660A0CF2' as SET_ID,
 '' as LEGAL_ENTITY_ID,
 '' as ESTABLISHMENT_ID,
 '' as COST_ALLOCATION_KEYFLEX_ID,
 '' as ACTION_OCCURENCE_ID,
 'A'  as STATUS,
 'INT' as INTERNAL_EXTERNAL_FLAG,
 '' as INTERNAL_ADDRESS_LINE,
 '' as ORGANIZATION_TYPE,
 '' as ATTRIBUTE_CATEGORY,
 '' as ATTRIBUTE1,
 '' as ATTRIBUTE2,
 '' as ATTRIBUTE3,
 '' as ATTRIBUTE4,
 '' as ATTRIBUTE5,
'' as ATTRIBUTE6,
'' as ATTRIBUTE7,
'' as ATTRIBUTE8,
'' as ATTRIBUTE9,
'' as ATTRIBUTE10,
'' as ATTRIBUTE11,
'' as ATTRIBUTE12,
'' as ATTRIBUTE13,
'' as ATTRIBUTE14,
'' as ATTRIBUTE15,
'' as ATTRIBUTE16,
'' as ATTRIBUTE17,
'' as ATTRIBUTE18,
'' as ATTRIBUTE19,
'' as ATTRIBUTE20,
'' as ATTRIBUTE21,
'' as ATTRIBUTE22,
'' as ATTRIBUTE23,
'' as ATTRIBUTE24,
'' as ATTRIBUTE25,
'' as ATTRIBUTE26,
'' as ATTRIBUTE27,
'' as ATTRIBUTE28,
'' as ATTRIBUTE29,
'' as ATTRIBUTE30,
'US' as SOURCE_LANG,
'' as ACTION_OCCURRENCE_ID1,
'DEPARTMENT' as CLASSIFICATION_CODE,
'' as LEGISLATION_CODE,
'DEPT_TBL' as FT_ALTERNATE_REC,
CONCAT('KTGA_DEP_',CRC32(UPPER(TRIM(П.`Наименование`)))) as FT_ALTERNATE_KEY
FROM kontrotenko_ktga.`Подразделения` П
GROUP BY CRC32(UPPER(TRIM(П.`Наименование`)))
) T
UNION ALL
SELECT T.* FROM
(
SELECT  CONCAT('KTGA_DEP_',CRC32(UPPER(TRIM(ПЗ.`Наименование`)))) as ORGANIZATION_ID,
DATE_FORMAT(
CASE
WHEN ПЗ.Состояние=1 THEN '4712-12-31 00:00:00' 
WHEN ПЗ.Состояние=2  
THEN 
(
SELECT MAX(ПС.EFFECTIVE_END_DATE) + INTERVAL 1 DAY 
FROM (
	     SELECT ПРД.`Дата`   AS EFFECTIVE_START_DATE
			,CASE 			
			WHEN ПРД.`ГруппаПриказа`='2' 
			THEN ( SELECT  КН.ДАТА FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			
			WHEN ( SELECT КН.ГруппаПриказа FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1)='2' 
			THEN ( SELECT  КН.ДАТА  FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1)
			WHEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА > ПРД.ДАТА  ORDER BY КН.`Дата` LIMIT 1) IS NOT NULL 
			THEN ( SELECT  КН.ДАТА - INTERVAL 1 DAY   FROM prykazy КН WHERE КН.PERSON_ID=ПРД.PERSON_ID AND КН.`ГруппаПриказа` IN(1,2,3) AND КН.ДАТА  > ПРД.ДАТА   ORDER BY КН.`Дата` LIMIT 1) ELSE ПРД.`Дата`
			 END  AS EFFECTIVE_END_DATE
			,
			ПРД.DEPARTMENT_ID
			,
			CASE WHEN ПРД.ГруппаПриказа='3' THEN 'INACTIVE' ELSE 'ACTIVE' END as 'STATUS'
			FROM prykazy ПРД
			WHERE  ПРД.ГруппаПриказа IN (1,2) 
		 ) ПС
		 WHERE ПС.DEPARTMENT_ID=CONCAT('KTGA_DEP_',CRC32(UPPER(TRIM(ПЗ.`Наименование`))))
)
ELSE '4712-12-31 00:00:00' END
,'%Y/%m/%d') as EFFECTIVE_START_DATE,
 '4712/12/31' as EFFECTIVE_END_DATE,
CONCAT('КТГА ',TRIM(ПЗ.`Наименование`)) as NAME,
'BC_BOLASHAK' as LOCATION_ID,
 '188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID,
 '188772AEC119AD11E053A647660A0CF2' as SET_ID,
'' as LEGAL_ENTITY_ID,
'' as ESTABLISHMENT_ID,
'' as COST_ALLOCATION_KEYFLEX_ID,
'' as ACTION_OCCURENCE_ID,
'I' as STATUS,
'INT' as INTERNAL_EXTERNAL_FLAG,
'' as INTERNAL_ADDRESS_LINE,
'' as ORGANIZATION_TYPE,
'' as ATTRIBUTE_CATEGORY,
'' as ATTRIBUTE1,
'' as ATTRIBUTE2,
'' as ATTRIBUTE3,
'' as ATTRIBUTE4,
'' as ATTRIBUTE5,
'' as ATTRIBUTE6,
'' as ATTRIBUTE7,
'' as ATTRIBUTE8,
'' as ATTRIBUTE9,
'' as ATTRIBUTE10,
'' as ATTRIBUTE11,
'' as ATTRIBUTE12,
'' as ATTRIBUTE13,
'' as ATTRIBUTE14,
'' as ATTRIBUTE15,
'' as ATTRIBUTE16,
'' as ATTRIBUTE17,
'' as ATTRIBUTE18,
'' as ATTRIBUTE19,
'' as ATTRIBUTE20,
'' as ATTRIBUTE21,
'' as ATTRIBUTE22,
'' as ATTRIBUTE23,
'' as ATTRIBUTE24,
'' as ATTRIBUTE25,
'' as ATTRIBUTE26,
'' as ATTRIBUTE27,
'' as ATTRIBUTE28,
'' as ATTRIBUTE29,
'' as ATTRIBUTE30,
'US' as SOURCE_LANG,
'' as ACTION_OCCURRENCE_ID1,
'DEPARTMENT' as CLASSIFICATION_CODE,
'' as LEGISLATION_CODE,
'DEPT_TBL' as FT_ALTERNATE_REC,
CONCAT('KTGA_DEP_', CRC32(UPPER(TRIM(ПЗ.`Наименование`)))) as FT_ALTERNATE_KEY
FROM kontrotenko_ktga.`Подразделения` ПЗ
WHERE ПЗ.Состояние!='1' AND  (SELECT MAX(ПИ.`ДатаКон`) FROM kontrotenko_ktga.`ПодразделенияИстория` ПИ WHERE CRC32(UPPER(TRIM(ПИ.`НаименованиеИстория`)))=CRC32(UPPER(TRIM(ПЗ.`Наименование`)))  ) IS NOT NULL 
GROUP BY CRC32(UPPER(TRIM(ПЗ.`Наименование`)))
) T

) KTGA
) ALLDEPARTMENTS
WHERE ALLDEPARTMENTS.EFFECTIVE_START_DATE IS NOT NULL AND ALLDEPARTMENTS.EFFECTIVE_END_DATE IS NOT NULL
ORDER BY ALLDEPARTMENTS.EFFECTIVE_START_DATE 