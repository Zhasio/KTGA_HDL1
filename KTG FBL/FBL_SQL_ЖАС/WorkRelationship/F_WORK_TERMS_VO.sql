SELECT CASE WHEN П.`КодСтатьи1` LIKE '100%' THEN 'HIRE' WHEN П.`КодСтатьи1` LIKE '200%' THEN 'TRANSFER' WHEN П.`КодСтатьи1` LIKE '300%' THEN 'TERMINATION' END as ACTION_CODE,'' as ACTION_OCCURRENCE_ID,CONCAT('WT_ASSIG', П.КодСотрудника) as ASSIGNMENT_ID,'' as ASSIGNMENT_NAME,'' as ASSIGNMENT_NUMBER,1 as ASSIGNMENT_SEQUENCE,'ACTIVE' as ASSIGNMENT_STATUS_TYPE,'119E67C19B66375BE053A747660A4A5B' as ASSIGNMENT_STATUS_TYPE_ID,'ET' as ASSIGNMENT_TYPE,'Y' as AUTO_END_FLAG,'' as BARGAINING_UNIT_CODE,'' as BILLING_TITLE,'11A3CAC8E20AB4E6E053A747660AF6EC' as BUSINESS_GROUP_ID,'1595C93AA3F5DCB2E053A747660A09BD' as BUSINESS_UNIT_ID,'' as CAGR_GRADE_DEF_ID,'' as CAGR_ID_FLEX_NUM,'' as COLLECTIVE_AGREEMENT_ID,'' as CONTRACT_ID,'' as DATE_PROBATION_END,'' as DEFAULT_CODE_COMB_ID,'' as DUTIES_TYPE,'4712-12-31' as EFFECTIVE_END_DATE,'Y' as EFFECTIVE_LATEST_CHANGE,1 as EFFECTIVE_SEQUENCE, DATE_FORMAT(П.`Дата`,'%Y-%m-%d') as EFFECTIVE_START_DATE,'' as EMPLOYEE_CATEGORY,'' as EMPLOYMENT_CATEGORY,'' as ESTABLISHMENT_ID,'' as EXPENSE_CHECK_ADDRESS,'' as FREQUENCY,'' as GRADE_ID,'' as GRADE_LADDER_PGM_ID,'' as HOURLY_SALARIED_CODE,'' as INTERNAL_BUILDING,'' as INTERNAL_FLOOR,'' as INTERNAL_LOCATION,'' as INTERNAL_MAILSTOP,'' as INTERNAL_OFFICE_NUMBER,'' as JOB_ID,'' as JOB_POST_SOURCE_NAME,'' as LABOUR_UNION_MEMBER_FLAG,'119E67C19A24375BE053A747660A4A5B' as LEGAL_ENTITY_ID,'KZ' as LEGISLATION_CODE,'' as LINKAGE_TYPE,'' as LOCATION_ID,'' as MANAGER_FLAG,'' as NORMAL_HOURS,'' as NOTICE_PERIOD,'' as NOTICE_PERIOD_UOM,'' as ORGANIZATION_ID,'' as PARENT_ASSIGNMENT_ID,'' as PEOPLE_GROUP_ID,CONCAT('PERIOD', П.КодСотрудника) as PERIOD_OF_SERVICE_ID,CONCAT('P', П.КодСотрудника) as PERSON_ID,'' as PERSON_TYPE_ID,'' as PO_HEADER_ID,'' as PO_LINE_ID,'' as POSITION_ID,'Y' as POSITION_OVERRIDE_FLAG,'' as POSTING_CONTENT_ID,'N' as PRIMARY_ASSIGNMENT_FLAG,'N' as PRIMARY_FLAG,'Y' as PRIMARY_WORK_RELATION_FLAG,'Y' as PRIMARY_WORK_TERMS_FLAG,'' as PROBATION_PERIOD,'' as PROBATION_UNIT,'' as PROJECT_TITLE,'' as PROJECTED_ASSIGNMENT_END,'' as PROPOSED_WORKER_TYPE,'' as REASON_CODE,'' as RECORD_CREATOR,'' as RETIREMENT_AGE,'' as RETIREMENT_DATE,'' as SAL_REVIEW_PERIOD,'' as SAL_REVIEW_PERIOD_FREQUENCY,'' as SET_OF_BOOKS_ID,'' as SOURCE_TYPE,'' as SPECIAL_CEILING_STEP_ID,'' as STEP_ENTRY_DATE,'EMP' as SYSTEM_PERSON_TYPE,'' as TAX_ADDRESS_ID,'' as TIME_NORMAL_FINISH,'' as TIME_NORMAL_START,'' as VENDOR_ASSIGNMENT_NUMBER,'' as VENDOR_EMPLOYEE_NUMBER,'' as VENDOR_ID,'' as VENDOR_SITE_ID,'' as WORK_AT_HOME,'' as WORK_TERMS_ASSIGNMENT_ID,'4712-12-31' as FREEZE_START_DATE,'1901-01-01' as FREEZE_UNTIL_DATE,'WT' as FT_ALTERNATE_REC,CONCAT('WT_ASSIG', П.КодСотрудника,'::WorkTerm') as FT_ALTERNATE_KEY
FROM Приказы П
WHERE П.`КодСтатьи1` REGEXP '^100|^200|^300' 