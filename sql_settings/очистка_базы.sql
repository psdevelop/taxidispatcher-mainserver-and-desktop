DELETE
  FROM [TDTwoRelease].[dbo].[Vhody_poljz] 
  WHERE Data<'2011-06-01 14:28:41.000'
DELETE 
  FROM [TDTwoRelease].[dbo].[BOLD_CLOCKLOG]
WHERE LastClockTime<'29-06-2010 00:00:00'
DELETE FROM Zakaz WHERE 
(SELECT [BOLD_ID]
      
  FROM [TDTwoRelease].[dbo].[Zakaz])

[TDTwoRelease].[dbo].[BOLD_XFILES]

DELETE 
  FROM [TDTwoRelease].[dbo].[BOLD_OBJECT]
  WHERE [BOLD_TYPE]=18 AND [BOLD_ID]<843900

BACKUP LOG TDTwoRelease WITH TRUNCATE_ONLY