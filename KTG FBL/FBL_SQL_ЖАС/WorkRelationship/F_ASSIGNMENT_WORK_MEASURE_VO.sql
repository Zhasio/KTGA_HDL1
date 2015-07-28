SELECT '' as ACTION_OCCURRENCE_ID,'Y' as ADDS_TO_BUDGET,CONCAT('ASG_FTE_P',П.`КодПриказа`) as ASSIGN_WORK_MEASURE_ID, CONCAT('ASSIG',П.`КодПриказа`) as ASSIGNMENT_ID,'' as BUSINESS_GROUP_ID,DATE_FORMAT(П.`Дата`,'%Y-%m-%d') as FFECTIVE_START_DATE,'4712-12-31' as EFFECTIVE_END_DATE,'FTE' as UNIT,1 as VALUE,'' as FT_ALTERNATE_REC,'' as FT_ALTERNATE_KEY
FROM Приказы П
WHERE П.`КодСтатьи1` REGEXP '^100|^200|^300'
