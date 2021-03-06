SELECT ALLS.* FROM
(
SELECT ALLS_WITH_ORDER.* FROM
(
SELECT KTG.* FROM
(
SELECT CONCAT('P',CRC32(UPPER(TRIM(С.ФИО)))) as PERSON_ID
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as EFFECTIVE_START_DATE
,'4712-12-31' as EFFECTIVE_END_DATE
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID1
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as START_DATE
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as START_DATE1
,'' as CORRESPONDENCE_LANGUAGE
,'' as BLOOD_TYPE
,DATE_FORMAT(С.ДатаРождения,'%Y-%m-%d') as DATE_OF_BIRTH
,'' as DATE_OF_DEATH
,'KZ' as COUNTRY_OF_BIRTH
,'' as REGION_OF_BIRTH
,'' as TOWN_OF_BIRTH
,'' as USER_GUID
,'' as PERSON_NUMBER
,CONCAT('MAIL',CRC32(UPPER(TRIM(С.ФИО)))) as PRIMARY_EMAIL_ID
,'' as PRIMARY_NID_ID
,'' as PRIMARY_NID_NUMBER
,'' as PRIMARY_PHONE_ID
,'' as MAILING_ADDRESS_ID
,'N' as WAIVE_DATA_PROTECT
,'' as APPLICANT_NUMBER
,'' as ATTRIBUTE_CATEGORY
,'' as ATTRIBUTE1
,'' as ATTRIBUTE2
,'' as ATTRIBUTE3
,'' as ATTRIBUTE4
,'' as ATTRIBUTE5
,'' as ATTRIBUTE6
,'' as ATTRIBUTE7
,'' as ATTRIBUTE8
,'' as ATTRIBUTE9
,'' as ATTRIBUTE10
,'' as ATTRIBUTE11
,'' as ATTRIBUTE12
,'' as ATTRIBUTE13
,'' as ATTRIBUTE14
,'' as ATTRIBUTE15
,'' as ATTRIBUTE16
,'' as ATTRIBUTE17
,'' as ATTRIBUTE18
,'' as ATTRIBUTE19
,'' as ATTRIBUTE20
,'' as ATTRIBUTE21
,'' as ATTRIBUTE22
,'' as ATTRIBUTE23
,'' as ATTRIBUTE24
,'' as ATTRIBUTE25
,'' as ATTRIBUTE26
,'' as ATTRIBUTE27
,'' as ATTRIBUTE28
,'' as ATTRIBUTE29
,'' as ATTRIBUTE30
,'' as ATTRIBUTE_CATEGORY1
,'' as ATTRIBUTE110
,'' as ATTRIBUTE210
,'' as ATTRIBUTE31
,'' as ATTRIBUTE41
,'' as ATTRIBUTE51
,'' as ATTRIBUTE61
,'' as ATTRIBUTE71
,'' as ATTRIBUTE81
,'' as ATTRIBUTE91
,'' as ATTRIBUTE101
,'' as ATTRIBUTE111
,'' as ATTRIBUTE121
,'' as ATTRIBUTE131
,'' as ATTRIBUTE141
,'' as ATTRIBUTE151
,'' as ATTRIBUTE161
,'' as ATTRIBUTE171
,'' as ATTRIBUTE181
,'' as ATTRIBUTE191
,'' as ATTRIBUTE201
,'' as ATTRIBUTE211
,'' as ATTRIBUTE221
,'' as ATTRIBUTE231
,'' as ATTRIBUTE241
,'' as ATTRIBUTE251
,'' as ATTRIBUTE261
,'' as ATTRIBUTE271
,'' as ATTRIBUTE281
,'' as ATTRIBUTE291
,'' as ATTRIBUTE301
,'' as ATTRIBUTE311
,'' as ATTRIBUTE32
,'' as ATTRIBUTE33
,'' as ATTRIBUTE34
,'' as ATTRIBUTE35
,'' as ATTRIBUTE36
,'' as ATTRIBUTE37
,'' as ATTRIBUTE38
,'' as ATTRIBUTE39
,'' as ATTRIBUTE40
,'' as ATTRIBUTE411
,'' as ATTRIBUTE42
,'' as ATTRIBUTE43
,'' as ATTRIBUTE44
,'' as ATTRIBUTE45
,'' as ATTRIBUTE46
,'' as ATTRIBUTE47
,'' as ATTRIBUTE48
,'' as ATTRIBUTE49
,'' as ATTRIBUTE50
,'PERSON' as FT_ALTERNATE_REC
,CONCAT('P',CRC32(UPPER(TRIM(С.ФИО)))) as FT_ALTERNATE_KEY
FROM kontrotenko_ktg.`Приказы` П
JOIN kontrotenko_ktg.`Сотрудники` С
ON П.`КодСотрудника`=С.`КодСотрудника`
GROUP BY UPPER(TRIM(С.`ФИО`))
) KTG
UNION ALL
SELECT KTGA.* FROM
(
SELECT CONCAT('P',CRC32(UPPER(TRIM(С.ФИО)))) as PERSON_ID
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as EFFECTIVE_START_DATE
,'4712-12-31' as EFFECTIVE_END_DATE
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID1
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as START_DATE
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as START_DATE1
,'' as CORRESPONDENCE_LANGUAGE
,'' as BLOOD_TYPE
,DATE_FORMAT(С.ДатаРождения,'%Y-%m-%d') as DATE_OF_BIRTH
,'' as DATE_OF_DEATH
,'KZ' as COUNTRY_OF_BIRTH
,'' as REGION_OF_BIRTH
,'' as TOWN_OF_BIRTH
,'' as USER_GUID
,'' as PERSON_NUMBER
,CONCAT('MAIL',CRC32(UPPER(TRIM(С.ФИО)))) as PRIMARY_EMAIL_ID
,'' as PRIMARY_NID_ID
,'' as PRIMARY_NID_NUMBER
,'' as PRIMARY_PHONE_ID
,'' as MAILING_ADDRESS_ID
,'N' as WAIVE_DATA_PROTECT
,'' as APPLICANT_NUMBER
,'' as ATTRIBUTE_CATEGORY
,'' as ATTRIBUTE1
,'' as ATTRIBUTE2
,'' as ATTRIBUTE3
,'' as ATTRIBUTE4
,'' as ATTRIBUTE5
,'' as ATTRIBUTE6
,'' as ATTRIBUTE7
,'' as ATTRIBUTE8
,'' as ATTRIBUTE9
,'' as ATTRIBUTE10
,'' as ATTRIBUTE11
,'' as ATTRIBUTE12
,'' as ATTRIBUTE13
,'' as ATTRIBUTE14
,'' as ATTRIBUTE15
,'' as ATTRIBUTE16
,'' as ATTRIBUTE17
,'' as ATTRIBUTE18
,'' as ATTRIBUTE19
,'' as ATTRIBUTE20
,'' as ATTRIBUTE21
,'' as ATTRIBUTE22
,'' as ATTRIBUTE23
,'' as ATTRIBUTE24
,'' as ATTRIBUTE25
,'' as ATTRIBUTE26
,'' as ATTRIBUTE27
,'' as ATTRIBUTE28
,'' as ATTRIBUTE29
,'' as ATTRIBUTE30
,'' as ATTRIBUTE_CATEGORY1
,'' as ATTRIBUTE110
,'' as ATTRIBUTE210
,'' as ATTRIBUTE31
,'' as ATTRIBUTE41
,'' as ATTRIBUTE51
,'' as ATTRIBUTE61
,'' as ATTRIBUTE71
,'' as ATTRIBUTE81
,'' as ATTRIBUTE91
,'' as ATTRIBUTE101
,'' as ATTRIBUTE111
,'' as ATTRIBUTE121
,'' as ATTRIBUTE131
,'' as ATTRIBUTE141
,'' as ATTRIBUTE151
,'' as ATTRIBUTE161
,'' as ATTRIBUTE171
,'' as ATTRIBUTE181
,'' as ATTRIBUTE191
,'' as ATTRIBUTE201
,'' as ATTRIBUTE211
,'' as ATTRIBUTE221
,'' as ATTRIBUTE231
,'' as ATTRIBUTE241
,'' as ATTRIBUTE251
,'' as ATTRIBUTE261
,'' as ATTRIBUTE271
,'' as ATTRIBUTE281
,'' as ATTRIBUTE291
,'' as ATTRIBUTE301
,'' as ATTRIBUTE311
,'' as ATTRIBUTE32
,'' as ATTRIBUTE33
,'' as ATTRIBUTE34
,'' as ATTRIBUTE35
,'' as ATTRIBUTE36
,'' as ATTRIBUTE37
,'' as ATTRIBUTE38
,'' as ATTRIBUTE39
,'' as ATTRIBUTE40
,'' as ATTRIBUTE411
,'' as ATTRIBUTE42
,'' as ATTRIBUTE43
,'' as ATTRIBUTE44
,'' as ATTRIBUTE45
,'' as ATTRIBUTE46
,'' as ATTRIBUTE47
,'' as ATTRIBUTE48
,'' as ATTRIBUTE49
,'' as ATTRIBUTE50
,'PERSON' as FT_ALTERNATE_REC
,CONCAT('P',CRC32(UPPER(TRIM(С.ФИО)))) as FT_ALTERNATE_KEY
FROM kontrotenko_ktga.`Приказы` П
JOIN kontrotenko_ktga.`Сотрудники` С
ON П.`КодСотрудника`=С.`КодСотрудника`
GROUP BY UPPER(TRIM(С.`ФИО`))
) KTGA
) ALLS_WITH_ORDER
ORDER BY ALLS_WITH_ORDER.EFFECTIVE_START_DATE
) ALLS
GROUP BY ALLS.PERSON_ID