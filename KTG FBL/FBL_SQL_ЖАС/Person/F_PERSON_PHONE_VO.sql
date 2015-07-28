select 
concat('PHONE',С.КодСотрудника) as PHONE_ID, '11A3CAC8E20AB4E6E053A747660AF6EC' as BUSINESS_GROUP_ID, 'H1' as PHONE_TYPE, CASE WHEN С.`ДатаЗаполнения` IS NOT NULL THEN DATE_FORMAT(С.`ДатаЗаполнения`,'%Y-%m-%d') ELSE '2002-02-14' END  as DATE_FROM, '4712-12-31' as DATE_TO, concat('P',С.КодСотрудника) as PERSON_ID, С.`ДомашнийТелефон` as PHONE_NUMBER, '' as COUNTRY_CODE_NUMBER, '' as EXTENSION, '' as SPEED_DIAL_NUMBER, '' as VALIDITY, '' as AREA_CODE, '' as SEARCH_PHONE_NUMBER, '' as PRIMARY_FLAG, '' as ATTRIBUTE_CATEGORY, '' as ATTRIBUTE1, '' as ATTRIBUTE2, '' as ATTRIBUTE3, '' as ATTRIBUTE4, '' as ATTRIBUTE5, '' as ATTRIBUTE6, '' as ATTRIBUTE7, '' as ATTRIBUTE8, '' as ATTRIBUTE9, '' as ATTRIBUTE10, '' as ATTRIBUTE11, '' as ATTRIBUTE12, '' as ATTRIBUTE13, '' as ATTRIBUTE14, '' as ATTRIBUTE15, '' as ATTRIBUTE16, '' as ATTRIBUTE17, '' as ATTRIBUTE18, '' as ATTRIBUTE19, '' as ATTRIBUTE20, '' as ATTRIBUTE21, '' as ATTRIBUTE22, '' as ATTRIBUTE23, '' as ATTRIBUTE24, '' as ATTRIBUTE25, '' as ATTRIBUTE26, '' as ATTRIBUTE27, '' as ATTRIBUTE28, '' as ATTRIBUTE29, '' as ATTRIBUTE30, '' as FT_ALTERNATE_REC, '' as FT_ALTERNATE_KEY
from Сотрудники С where  С.`ДомашнийТелефон` is not null
union all 
select 
case when М.`ДомашнийТелефон` is not null THEN concat('PHONE',М.КодСотрудника+10000) else concat('PHONE',М.`КодСотрудника`)  end as PHONE_ID, '11A3CAC8E20AB4E6E053A747660AF6EC' as BUSINESS_GROUP_ID, 'HM' as PHONE_TYPE, CASE WHEN М.`ДатаЗаполнения` IS NOT NULL THEN DATE_FORMAT(М.`ДатаЗаполнения`,'%Y-%m-%d') ELSE '2002-02-14' END  as DATE_FROM, '4712-12-31' as DATE_TO, concat('P',М.КодСотрудника) as PERSON_ID, М.`СотовыйТелефон` as PHONE_NUMBER, '' as COUNTRY_CODE_NUMBER, '' as EXTENSION, '' as SPEED_DIAL_NUMBER, '' as VALIDITY, '' as AREA_CODE, '' as SEARCH_PHONE_NUMBER, '' as PRIMARY_FLAG, '' as ATTRIBUTE_CATEGORY, '' as ATTRIBUTE1, '' as ATTRIBUTE2, '' as ATTRIBUTE3, '' as ATTRIBUTE4, '' as ATTRIBUTE5, '' as ATTRIBUTE6, '' as ATTRIBUTE7, '' as ATTRIBUTE8, '' as ATTRIBUTE9, '' as ATTRIBUTE10, '' as ATTRIBUTE11, '' as ATTRIBUTE12, '' as ATTRIBUTE13, '' as ATTRIBUTE14, '' as ATTRIBUTE15, '' as ATTRIBUTE16, '' as ATTRIBUTE17, '' as ATTRIBUTE18, '' as ATTRIBUTE19, '' as ATTRIBUTE20, '' as ATTRIBUTE21, '' as ATTRIBUTE22, '' as ATTRIBUTE23, '' as ATTRIBUTE24, '' as ATTRIBUTE25, '' as ATTRIBUTE26, '' as ATTRIBUTE27, '' as ATTRIBUTE28, '' as ATTRIBUTE29, '' as ATTRIBUTE30, '' as FT_ALTERNATE_REC, '' as FT_ALTERNATE_KEY
from Сотрудники М
where М.СотовыйТелефон is not null 

