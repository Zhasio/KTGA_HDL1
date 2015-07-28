SELECT
CONCAT('V1_PROF_ITEM_',СР.КодРаботы) as PROFILE_ITEM_ID,
CONCAT('V1_PREV_WORK_',СР.КодСотрудника) as PROFILE_ID,
'119E67C19BC1375BE053A747660A4A5B' as CONTENT_TYPE_ID,
'2015-06-02' as DATE_FROM,
СР.НаименованиеКомпании as ITEM_TEXT240_1,
'Y' as ITEM_TEXT30_1
FROM СотрудникиРабота СР
WHERE СР.`КодСотрудника`=92