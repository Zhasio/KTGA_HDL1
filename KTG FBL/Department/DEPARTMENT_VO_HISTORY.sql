SELECT  CONCAT('KTGA_',П.`КодПодразделения`) as ORGANIZATION_ID,(CASE  WHEN ПИ.`ДатаНач` IS NULL 
THEN   DATE_FORMAT(П.`Дата`,'%Y-%m-%d')
ELSE DATE_FORMAT(ПИ.`ДатаНач`,'%Y-%m-%d') 
END) as EFFECTIVE_START_DATE, (CASE  WHEN ПИ.`ДатаКон`  IS NOT NULL 
THEN DATE_FORMAT(ПИ.`ДатаКон`,'%Y-%m-%d') 
ELSE '4712-12-31'
END) as EFFECTIVE_END_DATE,П.`Наименование` as NAME,'1595C93AA609DCB2E053A747660A09BD' as LOCATION_ID,'11A3CAC8E20AB4E6E053A747660AF6EC' as BUSINESS_GROUP_ID,'119E67C19A18375BE053A747660A4A5B' as SET_ID,'' as LEGAL_ENTITY_ID,'' as ESTABLISHMENT_ID,'' as COST_ALLOCATION_KEYFLEX_ID,'' as ACTION_OCCURENCE_ID,CASE WHEN (CASE WHEN `ПИ`.`Состояние` IS NOT NULL THEN `ПИ`.`Состояние` ELSE П.`Состояние` END)=1 THEN 'A' ELSE 'I' END as STATUS,'INT' as INTERNAL_EXTERNAL_FLAG,'' as INTERNAL_ADDRESS_LINE,'' as ORGANIZATION_TYPE,'' as ATTRIBUTE_CATEGORY,'' as ATTRIBUTE1,'' as ATTRIBUTE2,'' as ATTRIBUTE3,'' as ATTRIBUTE4,'' as ATTRIBUTE5,'' as ATTRIBUTE6,'' as ATTRIBUTE7,'' as ATTRIBUTE8,'' as ATTRIBUTE9,'' as ATTRIBUTE10,'' as ATTRIBUTE11,'' as ATTRIBUTE12,'' as ATTRIBUTE13,'' as ATTRIBUTE14,'' as ATTRIBUTE15,'' as ATTRIBUTE16,'' as ATTRIBUTE17,'' as ATTRIBUTE18,'' as ATTRIBUTE19,'' as ATTRIBUTE20,'' as ATTRIBUTE21,'' as ATTRIBUTE22,'' as ATTRIBUTE23,'' as ATTRIBUTE24,'' as ATTRIBUTE25,'' as ATTRIBUTE26,'' as ATTRIBUTE27,'' as ATTRIBUTE28,'' as ATTRIBUTE29,'' as ATTRIBUTE30,'' as SOURCE_LANG,'US' as ACTION_OCCURRENCE_ID1,'DEPARTMENT' as CLASSIFICATION_CODE,'' as LEGISLATION_CODE,'DEPT_TBL' as FT_ALTERNATE_REC,CONCAT('KTGA_',П.`КодПодразделения`) as FT_ALTERNATE_KEY
FROM `Подразделения` П
LEFT JOIN `ПодразделенияИстория` ПИ
ON П.`КодПодразделения`=ПИ.`КодПодразделения`