SELECT ALLS.EMAIL_ADDRESS_ID,
ALLS.BUSINESS_GROUP_ID,
ALLS.PERSON_ID,
MIN(ALLS.DATE_FROM) as DATE_FROM,
ALLS.DATE_TO,
ALLS.EMAIL_TYPE,
ALLS.EMAIL_ADDRESS,
ALLS.PRIMARY_FLAG,
ALLS.MASTERED_IN_LDAP_FLAG,
ALLS.ATTRIBUTE_CATEGORY,
ALLS.ATTRIBUTE1,
ALLS.ATTRIBUTE2,
ALLS.ATTRIBUTE3,
ALLS.ATTRIBUTE4,
ALLS.ATTRIBUTE5,
ALLS.ATTRIBUTE6,
ALLS.ATTRIBUTE7,
ALLS.ATTRIBUTE8,
ALLS.ATTRIBUTE9,
ALLS.ATTRIBUTE10,
ALLS.ATTRIBUTE11,
ALLS.ATTRIBUTE12,
ALLS.ATTRIBUTE13,
ALLS.ATTRIBUTE14,
ALLS.ATTRIBUTE15,
ALLS.ATTRIBUTE16,
ALLS.ATTRIBUTE17,
ALLS.ATTRIBUTE18,
ALLS.ATTRIBUTE19,
ALLS.ATTRIBUTE20,
ALLS.ATTRIBUTE21,
ALLS.ATTRIBUTE22,
ALLS.ATTRIBUTE23,
ALLS.ATTRIBUTE24,
ALLS.ATTRIBUTE25,
ALLS.ATTRIBUTE26,
ALLS.ATTRIBUTE27,
ALLS.ATTRIBUTE28,
ALLS.ATTRIBUTE29,
ALLS.ATTRIBUTE30 FROM
(
SELECT ALLS_WITH_ORDER.* FROM
(
SELECT KTG.* FROM
(
SELECT 
CONCAT('M',CRC32(UPPER(TRIM(С.ФИО)))) as EMAIL_ADDRESS_ID
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
,CONCAT('P',CRC32(UPPER(TRIM(С.ФИО)))) as PERSON_ID
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as DATE_FROM
,'4712-12-31' as DATE_TO
,'W1' as EMAIL_TYPE
,concat(
trim(_fs_transliterate_ru(substr(С.`Имя`,1,1)))
,'.'
,trim(_fs_transliterate_ru(С.Фамилия))
,'@ktg.kz') as EMAIL_ADDRESS
,'Y' as PRIMARY_FLAG
,'' as MASTERED_IN_LDAP_FLAG
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
FROM kontrotenko_ktg.`Приказы` П
JOIN kontrotenko_ktg.`Сотрудники` С
ON П.`КодСотрудника`=С.`КодСотрудника`
GROUP BY UPPER(TRIM(С.`ФИО`))
) KTG
UNION ALL
SELECT KTGA.* FROM
(
SELECT 
CONCAT('M',CRC32(UPPER(TRIM(С.ФИО)))) as EMAIL_ADDRESS_ID
,'188772AEC11AAD11E053A647660A0CF2' as BUSINESS_GROUP_ID
,CONCAT('P',CRC32(UPPER(TRIM(С.ФИО)))) as PERSON_ID
,DATE_FORMAT(MIN(П.`Дата`),'%Y-%m-%d') as DATE_FROM
,'4712-12-31' as DATE_TO
,'W1' as EMAIL_TYPE
,concat(
trim(_fs_transliterate_ru(С.Фамилия))
,'_'
,trim(_fs_transliterate_ru(substr(С.`Имя`,1,1)))
,'@ktga.kz') as EMAIL_ADDRESS
,'Y' as PRIMARY_FLAG
,'' as MASTERED_IN_LDAP_FLAG
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
FROM kontrotenko_ktga.`Приказы` П
JOIN kontrotenko_ktga.`Сотрудники` С
ON П.`КодСотрудника`=С.`КодСотрудника`
GROUP BY UPPER(TRIM(С.`ФИО`))
) KTGA
) ALLS_WITH_ORDER
ORDER BY ALLS_WITH_ORDER.DATE_FROM DESC
) ALLS
GROUP BY ALLS.PERSON_ID