SELECT ALLS.* FROM
(
SELECT ALLS_WITH_ORDER.* FROM
(
SELECT KTG.* FROM
(
SELECT
concat('PHONE',CRC32(UPPER(TRIM(С.ФИО)))) as PHONE_ID
, '188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
, 'H1' as PHONE_TYPE
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as DATE_FROM
, '4712-12-31' as DATE_TO
, concat('P',CRC32(UPPER(TRIM(С.ФИО)))) as PERSON_ID
, С.`ДомашнийТелефон` as PHONE_NUMBER
, '' as COUNTRY_CODE_NUMBER
, '' as EXTENSION
, '' as SPEED_DIAL_NUMBER
, '' as VALIDITY
, '' as AREA_CODE
, '' as SEARCH_PHONE_NUMBER
, '' as PRIMARY_FLAG
, '' as ATTRIBUTE_CATEGORY
, '' as ATTRIBUTE1
, '' as ATTRIBUTE2
, '' as ATTRIBUTE3
, '' as ATTRIBUTE4
, '' as ATTRIBUTE5
, '' as ATTRIBUTE6
, '' as ATTRIBUTE7
, '' as ATTRIBUTE8
, '' as ATTRIBUTE9
, '' as ATTRIBUTE10
, '' as ATTRIBUTE11
, '' as ATTRIBUTE12
, '' as ATTRIBUTE13
, '' as ATTRIBUTE14
, '' as ATTRIBUTE15
, '' as ATTRIBUTE16
, '' as ATTRIBUTE17
, '' as ATTRIBUTE18
, '' as ATTRIBUTE19
, '' as ATTRIBUTE20
, '' as ATTRIBUTE21
, '' as ATTRIBUTE22
, '' as ATTRIBUTE23
, '' as ATTRIBUTE24
, '' as ATTRIBUTE25
, '' as ATTRIBUTE26
, '' as ATTRIBUTE27
, '' as ATTRIBUTE28
, '' as ATTRIBUTE29
, '' as ATTRIBUTE30
, '' as FT_ALTERNATE_REC
, '' as FT_ALTERNATE_KEY
FROM kontrotenko_ktg.`Приказы` П
JOIN kontrotenko_ktg.`Сотрудники` С
ON П.`КодСотрудника`=С.`КодСотрудника`
where  С.`ДомашнийТелефон` is not null
GROUP BY UPPER(TRIM(С.`ФИО`))
union all 
select 
case when М.`ДомашнийТелефон` is not null THEN concat('PHONE'
,CRC32(UPPER(TRIM(М.ФИО)))+10000) else concat('PHONE'
,CRC32(UPPER(TRIM(М.ФИО))))  end as PHONE_ID
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
,'HM' as PHONE_TYPE
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as DATE_FROM
,'4712-12-31' as DATE_TO
,concat('P',CRC32(UPPER(TRIM(М.ФИО)))) as PERSON_ID
, М.`СотовыйТелефон` as PHONE_NUMBER
, '' as COUNTRY_CODE_NUMBER
, '' as EXTENSION
, '' as SPEED_DIAL_NUMBER
, '' as VALIDITY
, '' as AREA_CODE
, '' as SEARCH_PHONE_NUMBER
, '' as PRIMARY_FLAG
, '' as ATTRIBUTE_CATEGORY
, '' as ATTRIBUTE1
, '' as ATTRIBUTE2
, '' as ATTRIBUTE3
, '' as ATTRIBUTE4
, '' as ATTRIBUTE5
, '' as ATTRIBUTE6
, '' as ATTRIBUTE7
, '' as ATTRIBUTE8
, '' as ATTRIBUTE9
, '' as ATTRIBUTE10
, '' as ATTRIBUTE11
, '' as ATTRIBUTE12
, '' as ATTRIBUTE13
, '' as ATTRIBUTE14
, '' as ATTRIBUTE15
, '' as ATTRIBUTE16
, '' as ATTRIBUTE17
, '' as ATTRIBUTE18
, '' as ATTRIBUTE19
, '' as ATTRIBUTE20
, '' as ATTRIBUTE21
, '' as ATTRIBUTE22
, '' as ATTRIBUTE23
, '' as ATTRIBUTE24
, '' as ATTRIBUTE25
, '' as ATTRIBUTE26
, '' as ATTRIBUTE27
, '' as ATTRIBUTE28
, '' as ATTRIBUTE29
, '' as ATTRIBUTE30
, '' as FT_ALTERNATE_REC
, '' as FT_ALTERNATE_KEY
FROM kontrotenko_ktg.`Приказы` П
JOIN kontrotenko_ktg.`Сотрудники` М
ON П.`КодСотрудника`=М.`КодСотрудника`
where М.СотовыйТелефон is not null 
GROUP BY UPPER(TRIM(М.`ФИО`))

) KTG
UNION ALL
SELECT KTGA.* FROM
(
SELECT
concat('PHONE',CRC32(UPPER(TRIM(С.ФИО)))) as PHONE_ID
, '188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
, 'H1' as PHONE_TYPE
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as DATE_FROM
, '4712-12-31' as DATE_TO
, concat('P',CRC32(UPPER(TRIM(С.ФИО)))) as PERSON_ID
, С.`ДомашнийТелефон` as PHONE_NUMBER
, '' as COUNTRY_CODE_NUMBER
, '' as EXTENSION
, '' as SPEED_DIAL_NUMBER
, '' as VALIDITY
, '' as AREA_CODE
, '' as SEARCH_PHONE_NUMBER
, '' as PRIMARY_FLAG
, '' as ATTRIBUTE_CATEGORY
, '' as ATTRIBUTE1
, '' as ATTRIBUTE2
, '' as ATTRIBUTE3
, '' as ATTRIBUTE4
, '' as ATTRIBUTE5
, '' as ATTRIBUTE6
, '' as ATTRIBUTE7
, '' as ATTRIBUTE8
, '' as ATTRIBUTE9
, '' as ATTRIBUTE10
, '' as ATTRIBUTE11
, '' as ATTRIBUTE12
, '' as ATTRIBUTE13
, '' as ATTRIBUTE14
, '' as ATTRIBUTE15
, '' as ATTRIBUTE16
, '' as ATTRIBUTE17
, '' as ATTRIBUTE18
, '' as ATTRIBUTE19
, '' as ATTRIBUTE20
, '' as ATTRIBUTE21
, '' as ATTRIBUTE22
, '' as ATTRIBUTE23
, '' as ATTRIBUTE24
, '' as ATTRIBUTE25
, '' as ATTRIBUTE26
, '' as ATTRIBUTE27
, '' as ATTRIBUTE28
, '' as ATTRIBUTE29
, '' as ATTRIBUTE30
, '' as FT_ALTERNATE_REC
, '' as FT_ALTERNATE_KEY
FROM kontrotenko_ktga.`Приказы` П
JOIN kontrotenko_ktga.`Сотрудники` С
ON П.`КодСотрудника`=С.`КодСотрудника`
where  С.`ДомашнийТелефон` is not null
GROUP BY UPPER(TRIM(С.`ФИО`))
union all 
select 
case when М.`ДомашнийТелефон` is not null THEN concat('PHONE'
,CRC32(UPPER(TRIM(М.ФИО)))+10000) else concat('PHONE'
,CRC32(UPPER(TRIM(М.ФИО))))  end as PHONE_ID
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
,'HM' as PHONE_TYPE
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as DATE_FROM
,'4712-12-31' as DATE_TO
,concat('P',CRC32(UPPER(TRIM(М.ФИО)))) as PERSON_ID
, М.`СотовыйТелефон` as PHONE_NUMBER
, '' as COUNTRY_CODE_NUMBER
, '' as EXTENSION
, '' as SPEED_DIAL_NUMBER
, '' as VALIDITY
, '' as AREA_CODE
, '' as SEARCH_PHONE_NUMBER
, '' as PRIMARY_FLAG
, '' as ATTRIBUTE_CATEGORY
, '' as ATTRIBUTE1
, '' as ATTRIBUTE2
, '' as ATTRIBUTE3
, '' as ATTRIBUTE4
, '' as ATTRIBUTE5
, '' as ATTRIBUTE6
, '' as ATTRIBUTE7
, '' as ATTRIBUTE8
, '' as ATTRIBUTE9
, '' as ATTRIBUTE10
, '' as ATTRIBUTE11
, '' as ATTRIBUTE12
, '' as ATTRIBUTE13
, '' as ATTRIBUTE14
, '' as ATTRIBUTE15
, '' as ATTRIBUTE16
, '' as ATTRIBUTE17
, '' as ATTRIBUTE18
, '' as ATTRIBUTE19
, '' as ATTRIBUTE20
, '' as ATTRIBUTE21
, '' as ATTRIBUTE22
, '' as ATTRIBUTE23
, '' as ATTRIBUTE24
, '' as ATTRIBUTE25
, '' as ATTRIBUTE26
, '' as ATTRIBUTE27
, '' as ATTRIBUTE28
, '' as ATTRIBUTE29
, '' as ATTRIBUTE30
, '' as FT_ALTERNATE_REC
, '' as FT_ALTERNATE_KEY
FROM kontrotenko_ktga.`Приказы` П
JOIN kontrotenko_ktga.`Сотрудники` М
ON П.`КодСотрудника`=М.`КодСотрудника`
where М.СотовыйТелефон is not null 
GROUP BY UPPER(TRIM(М.`ФИО`))
) KTGA
) ALLS_WITH_ORDER
ORDER BY ALLS_WITH_ORDER.DATE_FROM DESC
) ALLS
GROUP BY CONCAT(ALLS.PERSON_ID,ALLS.PHONE_TYPE)