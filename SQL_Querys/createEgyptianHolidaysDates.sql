-- ÃæáÇğ: ÅÖÇİÉ ÚãæÏ ÌÏíÏ ááÃÚíÇÏ ÈÇááÛÉ ÇáÚÑÈíÉ
--ALTER TABLE dbo.Dim_Date
--ADD Holiday_name_ar nvarchar(100) NULL;
--GO

-- ËÇäíÇğ: ÍĞİ ÌãíÚ ÇáÃÚíÇÏ ÇáÍÇáíÉ
UPDATE dbo.Dim_Date
SET Holiday_name_en = NULL,
    Holiday_name_ar = NULL;
GO

-- ËÇáËÇğ: ÅÖÇİÉ ÇáÃÚíÇÏ æÇáãäÇÓÈÇÊ ÇáãÕÑíÉ

-- ÑÃÓ ÇáÓäÉ ÇáãíáÇÏíÉ (1 íäÇíÑ)
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'New Year''s Day',
    Holiday_name_ar = N'ÑÃÓ ÇáÓäÉ ÇáãíáÇÏíÉ'
WHERE Month = '01' AND Day = '01';

-- ËæÑÉ 25 íäÇíÑ
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'January 25 Revolution Day and Police Day',
    Holiday_name_ar = N'ËæÑÉ 25 íäÇíÑ æíæã ÇáÔÑØÉ'
WHERE Month = '01' AND Day = '25';

-- ÚíÏ ÊÍÑíÑ ÓíäÇÁ (25 ÃÈÑíá)
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Sinai Liberation Day',
    Holiday_name_ar = N'ÚíÏ ÊÍÑíÑ ÓíäÇÁ'
WHERE Month = '04' AND Day = '25';

-- ÚíÏ ÇáÚãÇá (1 ãÇíæ)
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Labor Day',
    Holiday_name_ar = N'íæã ÇáÚãÇá'
WHERE Month = '05' AND Day = '01';

-- ËæÑÉ 30 íæäíæ
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'June 30 Revolution Day',
    Holiday_name_ar = N'ËæÑÉ 30 íæäíæ'
WHERE Month = '06' AND Day = '30';

-- ÚíÏ ÇáİØÑ
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Eid al-Fitr',
    Holiday_name_ar = N'ÚíÏ ÇáİØÑ'
WHERE Date IN ('2020-05-24', '2021-05-13', '2022-05-02', '2023-04-21', '2024-04-10');

-- ÚíÏ ÇáÃÖÍì
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Eid al-Adha',
    Holiday_name_ar = N'ÚíÏ ÇáÃÖÍì'
WHERE Date IN ('2020-07-31', '2021-07-20', '2022-07-09', '2023-06-28', '2024-06-16');

-- ÑÃÓ ÇáÓäÉ ÇáåÌÑíÉ
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Islamic New Year',
    Holiday_name_ar = N'ÑÃÓ ÇáÓäÉ ÇáåÌÑíÉ'
WHERE Date IN ('2020-08-20', '2021-08-09', '2022-07-30', '2023-07-19', '2024-07-07');

-- ÚíÏ ÇáŞæÇÊ ÇáãÓáÍÉ (6 ÃßÊæÈÑ)
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Armed Forces Day',
    Holiday_name_ar = N'ÚíÏ ÇáŞæÇÊ ÇáãÓáÍÉ'
WHERE Month = '10' AND Day = '06';

-- ÚíÏ ÇáäÕÑ (23 ÏíÓãÈÑ)
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Victory Day',
    Holiday_name_ar = N'ÚíÏ ÇáäÕÑ'
WHERE Month = '12' AND Day = '23';

-- Ôã ÇáäÓíã
UPDATE dbo.Dim_Date
SET Holiday_name_en = 'Sham El Nessim',
    Holiday_name_ar = N'Ôã ÇáäÓíã'
WHERE Date IN ('2020-04-20', '2021-05-03', '2022-04-25', '2023-04-17', '2024-05-06');
GO

---- ÅäÔÇÁ İåÑÓ Úáì ÇáÚãæÏ ÇáÌÏíÏ ÈÇááÛÉ ÇáÚÑÈíÉ
--CREATE NONCLUSTERED INDEX IDX_Dim_Date_Holiday_name_ar ON dbo.Dim_Date (Holiday_name_ar ASC)
--WITH (
--    PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF,
--    IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF,
--    ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90
--) ON [PRIMARY];
--GO

-- ÅÏÑÇÌ ÇáŞíãÉ ÇáÇİÊÑÇÖíÉ ÅĞÇ áã ÊæÌÏ ãäÇÓÈÉ
UPDATE dbo.Dim_Date 
SET Holiday_name_en = 'No Holiday',
    Holiday_name_ar = N'áÇ íæÌÏ ãäÇÓÈÉ'
WHERE Holiday_name_en IS NULL OR Holiday_name_ar IS NULL;
GO
