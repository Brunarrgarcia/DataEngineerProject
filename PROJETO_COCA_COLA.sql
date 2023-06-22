   /* DR2045 BEBIDAS */
    INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2045_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTTAXCOD1]
           ,[ARTTAXCOD3]
           ,[ARTTAXCOD4]
           ,[ARTNUM]
           ,[DataRules_GR_DR2045_DR2045_1]
           ,[DataRules_GR_DR2045_DR2045_2]
           ,[DataRules_GR_DR2045_DR2045_3]
           ,[DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado])
            SELECT USER
                    ,USER
                    ,GETDATE()
                    ,0
                    ,row_number() over (order by AM01.ARTNUM)
                    ,EFTDAT
                    ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12))
                    ,ARTTYP
                    ,ARTCLSCOD
                    ,SPRCOD
                    ,ARTTAXCOD1
                    ,ARTTAXCOD3
                    ,ARTTAXCOD4
                    ,ARTNUM
                    ,CASE WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD1 <> '' AND ARTTAXCOD1 = 0)
                                )
                        THEN 'Cumple'
                            WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD1 = '' OR ARTTAXCOD1 <> 0)
                                )
                        THEN 'NoCumple' ELSE 'NoAplica' END AS "DR2045.1"
                    ,CASE WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    ARTTAXCOD3 IN ('0', '1')
                                )
                        THEN 'Cumple'
                            WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    ARTTAXCOD3 NOT IN ('0', '1')
                                )
                        THEN 'NoCumple' ELSE 'NoAplica' END AS "DR2045.2"
                    ,CASE WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD4 IS NULL OR TRIM(ARTTAXCOD4) = '')
                                )
                        THEN 'Cumple'
                            WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD4 IS NOT NULL OR TRIM(ARTTAXCOD4) <> '')
                                )
                        THEN 'NoCumple' ELSE 'NoAplica' END AS "DR2045.3"
                    ,CASE WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD1 <> '' AND ARTTAXCOD1 = 0)
                                )
                                AND
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    ARTTAXCOD3 IN ('0', '1')
                                )
                                AND
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD4 IS NULL OR TRIM(ARTTAXCOD4) = '')
                                )
                        THEN 'Cumple'
                            WHEN
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD1 = '' OR ARTTAXCOD1 <> 0)
                                )
                                AND
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    ARTTAXCOD3 NOT IN ('0', '1')
                                )
                                AND
                                (
                                    EFTDAT = '1999999' AND
                                    ARTTYP = '1' AND 
                                    ARTCLSCOD = '7' AND
                                    SPRCOD <> 'S' AND
                                    (ARTTAXCOD4 IS NOT NULL OR TRIM(ARTTAXCOD4) <> '')
                                )
                        THEN 'NoCumple' ELSE 'NoAplica' END AS "DR2045"
            FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC AS AM01;

    /*2002 BEBIDAS*/
    INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
            ([T_LAST_USER_ID]
            ,[T_CREATOR_ID]
            ,[T_CREATION_DATE]
            ,[T_LAST_WRITE]
            ,[DR2002_BEB_EC_ID]
            ,[ARTNUM]
            ,[ARTNAM]
            ,[EFTDAT]
            ,[EFTDATD]
            ,[ARTTYP]
            ,[ARTCLSCOD]
            ,[ARTLNKNUM3_1_2]
            ,[SPRCOD]
            ,[ARTGRP3]
            ,[NUMSUU]
            ,[UNIMSRUNI]
            ,[ARTCNVFAC1]
            ,[ARTGRP04]
            ,[ARTCNVFAC2]
            ,[ARTCNVFAC3]
            ,[ARTCNVFAC4]
            ,[ARTCNVFAC5]
            ,[ARTGRP02]
            ,[USRCNT04]
            ,[USRDEC01]
            ,[MIXART1]
            ,[UNIMSRSUU]
            ,[MIXART2]
            ,[MIXART3]
            ,[MIXART4]
            ,[MIXART5]
            ,[MIXART6]
            ,[USRDEC02]
            ,[USRDEC03]
            ,[USRDEC04]
            ,[USRDEC05]
            ,[USRINT01]
            ,[USRINT02]
            ,[USRINT03]
            ,[USRINT04]
            ,[USRINT05]
            ,[MIXSUU1]
            ,[MIXSUU2]
            ,[MIXSUU3]
            ,[USRCNT03]
            ,[MIXSUU4]
            ,[MIXSUU5]
            ,[MIXSUU6]
            ,[EFRDAT]
            ,[EFRDATD]
            ,[DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado]
            ,[DataRules_GR_DR2002_DR2002_1]
            ,[DataRules_GR_DR2002_DR2002_2]
            ,[DataRules_GR_DR2002_DR2002_3]
            ,[DataRules_GR_DR2002_DR2002_4]
            ,[DataRules_GR_DR2002_DR2002_5]
            ,[DataRules_GR_DR2002_DR2002_6]
            ,[DataRules_GR_DR2002_DR2002_7]
            ,[DataRules_GR_DR2002_DR2002_8]
            ,[DataRules_GR_DR2002_DR2002_9]
            ,[DataRules_GR_DR2002_DR2002_10]
            ,[DataRules_GR_DR2002_DR2002_11]
            ,[DataRules_GR_DR2002_DR2002_12])
                SELECT USER
                ,USER 
                ,GETDATE()
                ,0
                ,row_number() OVER (order by AM01.ARTNUM)
                ,AM01.ARTNUM
                ,AM01.ARTNAM
                ,AM01.EFTDAT
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12))
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.ARTLNKNUM3_1_2
                ,AM01.SPRCOD
                ,AM01.ARTGRP3
                ,AM01.NUMSUU
                ,AM01.UNIMSRUNI
                ,AM01.ARTCNVFAC1
                ,AM01.ARTGRP04
                ,AM01.ARTCNVFAC2
                ,AM01.ARTCNVFAC3
                ,AM01.ARTCNVFAC4
                ,AM01.ARTCNVFAC5
                ,AM01.ARTGRP02
                ,AM01.USRCNT04
                ,AM01.USRDEC01
                ,AM01.MIXART1
                ,AM01.UNIMSRSUU
                ,AM01.MIXART2
                ,AM01.MIXART3
                ,AM01.MIXART4
                ,AM01.MIXART5
                ,AM01.MIXART6
                ,AM01.USRDEC02
                ,AM01.USRDEC03
                ,AM01.USRDEC04
                ,AM01.USRDEC05
                ,AM01.USRINT01
                ,AM01.USRINT02
                ,AM01.USRINT03
                ,AM01.USRINT04
                ,AM01.USRINT05
                ,AM01.MIXSUU1
                ,AM01.MIXSUU2
                ,AM01.MIXSUU3
                ,AM01.USRCNT03
                ,AM01.MIXSUU4
                ,AM01.MIXSUU5
                ,AM01.MIXSUU6
                ,AM01.EFRDAT
                ,TRY_CONVERT(DATE, RIGHT(AM01.EFRDAT, 6), 12) 
                ,'Cumple'
                ,CASE 
                        WHEN 
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP3 = 'D')
                        THEN 'Cumple' 
                        WHEN 
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '') 
                        AND AM01.ARTGRP3 <> 'D')
                        THEN 'NoCumple' 
                        ELSE 'NoAplica' 
                        END AS DR2002_1
                ,CASE 
                        WHEN 
                            (AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7' 
                            AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND AM01.MIXART1 = '0'
                            AND CHARINDEX(')', AM01.ARTNAM ) = 0)
                            THEN 
                            (CASE
                                WHEN SUBSTRING(LTRIM(RTRIM(ARTNAM)), LEN(LTRIM(RTRIM(ARTNAM))) - 1, 2) = CONVERT(VARCHAR, NUMSUU)
                                THEN 'Cumple'
                                ELSE 'NoCumple'
                            END)
                        WHEN
                            (AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7' 
                            AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND AM01.MIXART1 = '0'
                            AND CHARINDEX(')', AM01.ARTNAM ) > 0) 
                            THEN 
                            (CASE 
                                WHEN AM01.ARTNAM LIKE ('%(' + CONVERT(VARCHAR, NUMSUU) + ')%')
                                THEN 'Cumple'
                                ELSE 'NoCumple'
                            END)
                        ELSE 'NoAplica'
                        END AS DR2002_2                       
                ,CASE 
                        WHEN 
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.NUMSUU = '1')
                        THEN 'Cumple' 

                        WHEN  
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '') 
                        AND AM01.MIXART1 <> '0'
                        AND AM01.NUMSUU <> 1)
                        THEN 'NoCumple' 
                        ELSE 'NoAplica' 
                        END AS DR2002_3
                ,CASE 
                        WHEN 
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.UNIMSRUNI IN ('UN', 'CJ'))
                        THEN 
                        (CASE 
                            WHEN (AM01.UNIMSRUNI = 'UN' AND AM01.ARTGRP04 = '99') OR (AM01.UNIMSRUNI = 'CJ' AND AM01.ARTGRP04 <> '99') 
                            THEN 'Cumple'
                            ELSE 'NoCumple'
                        END)
                        WHEN 
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.UNIMSRUNI NOT IN ('UN', 'CJ'))
                        THEN 'NoCumple'
                        ELSE 'NoAplica'
                        END AS DR2002_4
                ,CASE
                        WHEN
                            (AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7' 
                            AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = ''))
                            THEN
                            (CASE
                                WHEN (AM01.UNIMSRSUU = 'BT' AND AM01.ARTGRP04 <> '99' AND AM01.ARTGRP02 <> 'EI')
                                OR (AM01.UNIMSRSUU ='XX' AND AM01.ARTGRP04 = '99') 
                                OR (AM01.UNIMSRSUU = 'LA' AND AM01.ARTGRP02 = 'EI')
                                THEN 'Cumple'
                                ELSE 'NoCumple'
                            END) 
                        WHEN 
                            AM01.EFTDAT <> '1999999' 
                            OR AM01.ARTTYP <> '1' 
                            OR AM01.ARTCLSCOD <> '7' 
                            OR AM01.ARTLNKNUM3_1_2 <> 'AF' 
                            OR (AM01.SPRCOD IS NOT NULL OR TRIM(AM01.SPRCOD) <> '')
                            OR AM01.UNIMSRSUU <> 'BT' 
                            OR AM01.UNIMSRSUU <>'XX' 
                            OR AM01.UNIMSRSUU <> 'LA' 
                            THEN 'NoAplica'
                        END AS DR2002_5
                ,CASE
                        WHEN
                            (EFTDAT = '1999999' 
                            AND ARTTYP = '1' 
                            AND ARTCLSCOD = '7' 
                            AND ARTLNKNUM3_1_2 = 'AF'
                            AND MIXART1 = '0'
                            AND ARTCNVFAC1 = '0'
                            AND ARTGRP04 <> '99'
                            AND (SPRCOD IS NULL OR TRIM(SPRCOD) = ''))
                        THEN 'NoCumple'
                        WHEN
                            (EFTDAT = '1999999' 
                            AND ARTTYP = '1' 
                            AND ARTCLSCOD = '7' 
                            AND ARTLNKNUM3_1_2 = 'AF' 
                            AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
                            AND MIXART1 = '0'
                            AND ARTCNVFAC1 <> ROUND(SD.DESCRIPCION * ISNULL(NUMSUU,1)/5678.00, 5))
                        THEN 'NoCumple'
                        WHEN 
                            (AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7' 
                            AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND AM01.MIXART1 = '0'
                            AND AM01.ARTCNVFAC1 = 0
                            AND ARTGRP04 ='99')
                        THEN 'Cumple'
                        WHEN
                            (AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7' 
                            AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND AM01.MIXART1 = '0'
                            AND AM01.ARTCNVFAC1 = ROUND(SD.DESCRIPCION * ISNULL(AM01.NUMSUU,1)/5678.00, 5))
                        THEN 'Cumple'
                        ELSE 'NoAplica'
                        END AS DR2002_6
                 ,CASE 
                    WHEN
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP04 NOT IN ('98', '99')
                        THEN
                        (CASE 
                            WHEN
                            AM01.ARTCNVFAC1 = ROUND(SD.DESCRIPCION * (ISNULL(AM01.MIXSUU1,0)
                            +ISNULL(AM01.MIXSUU2,0)
                            +ISNULL(AM01.MIXSUU3,0)
                            +ISNULL(AM01.MIXSUU4,0)
                            +ISNULL(AM01.MIXSUU5,0)
                            +ISNULL(AM01.MIXSUU6,0)
                            +ISNULL(AM01.USRINT02,0)
                            +ISNULL(AM01.USRINT04,0)
                            +ISNULL(AM01.USRDEC01,0)
                            +ISNULL(AM01.USRDEC03,0)
                            +ISNULL(AM01.USRDEC05,0)
                            +ISNULL(AM01.USRCNT04,0))/5678,5) 
                        THEN 'Cumple'
                        ELSE 'NoCumple'
                        END)
                    WHEN
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP04 IN ('98', '99')
                        AND AM01.NUMSUU <> '1'
                        THEN
                        (CASE 
                            WHEN 
                            AM01.ARTCNVFAC1 = ROUND(AM01.NUMSUU * SD.DESCRIPCION / 5678.00, 5) 
                        THEN 'Cumple'
                        ELSE 'NoCumple'
                        END)
                    WHEN
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1'
                        AND AM01.ARTCLSCOD = '7'
                        AND AM01.ARTLNKNUM3_1_2 = 'AF'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP04 IN ('98', '99') 
                        AND AM01.NUMSUU = '1'
                        THEN 
                            (CASE 
                                WHEN
                                    AM01.ARTCNVFAC1 = ROUND((ISNULL(AM01.MIXSUU1,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD                             
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART1 AND ART.NUMSUU > 0), 0) / 5678.0) 
                                    + 
                                    (ISNULL(AM01.MIXSUU2,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD                             
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART2 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.MIXSUU3,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART3 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.MIXSUU4,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART4 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    + 
                                    (ISNULL(AM01.MIXSUU5,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART5 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.MIXSUU6,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART6 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRINT02,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT01 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRINT04,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT03 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRDEC01,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT05 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRDEC03,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRDEC02 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRDEC05,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRDEC04 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    + 
                                    (ISNULL(AM01.USRCNT04,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRCNT03 AND ART.NUMSUU > 0), 0) / 5678.0), 5)
                            THEN 'Cumple'
                            ELSE 'NoCumple'
                            END)
                    WHEN
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1'
                        AND AM01.ARTCLSCOD = '7'
                        AND AM01.ARTLNKNUM3_1_2 = 'AF'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP04 IN ('98', '99') 
                        AND AM01.NUMSUU = '1'
                        THEN 
                            (CASE 
                                WHEN
                                    AM01.ARTCNVFAC1 = ROUND((ISNULL(AM01.MIXSUU1,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD                             
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART1 AND ART.NUMSUU > 0), 0) / 5678.0) 
                                    + 
                                    (ISNULL(AM01.MIXSUU2,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD                             
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART2 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.MIXSUU3,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART3 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.MIXSUU4,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART4 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    + 
                                    (ISNULL(AM01.MIXSUU5,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART5 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.MIXSUU6,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART6 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRINT02,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT01 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRINT04,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT03 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRDEC01,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT05 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRDEC03,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRDEC02 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    +
                                    (ISNULL(AM01.USRDEC05,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRDEC04 AND ART.NUMSUU > 0), 0) / 5678.0)
                                    + 
                                    (ISNULL(AM01.USRCNT04,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                    LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                    WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRCNT03 AND ART.NUMSUU > 0), 0) / 5678.0), 4)
                            THEN 'Cumple'
                            ELSE 'NoCumple'
                            END)
                        WHEN
                            AM01.EFTDAT = '1999999'
                            AND AM01.ARTTYP = '1'
                            AND AM01.ARTCLSCOD = '7'
                            AND AM01.ARTLNKNUM3_1_2 = 'AF'
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND AM01.MIXART1 <> '0'
                            AND AM01.ARTGRP04 IN ('98', '99') 
                            AND AM01.NUMSUU = '1'
                            THEN 
                                (CASE 
                                    WHEN
                                        AM01.ARTCNVFAC1 = ROUND((ISNULL(AM01.MIXSUU1,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD                             
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART1 AND ART.NUMSUU > 0), 0) / 5678.0) 
                                        + 
                                        (ISNULL(AM01.MIXSUU2,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD                             
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART2 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.MIXSUU3,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART3 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.MIXSUU4,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART4 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        + 
                                        (ISNULL(AM01.MIXSUU5,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART5 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.MIXSUU6,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.MIXART6 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.USRINT02,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT01 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.USRINT04,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT03 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.USRDEC01,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRINT05 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.USRDEC03,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRDEC02 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        +
                                        (ISNULL(AM01.USRDEC05,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRDEC04 AND ART.NUMSUU > 0), 0) / 5678.0)
                                        + 
                                        (ISNULL(AM01.USRCNT04,0) * ISNULL((SELECT TOP 1 SD.DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD 
                                        LEFT JOIN [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART ON ART.ARTGRP04 = SD.SD2002_ARTGRP04
                                        WHERE ART.EFTDAT = 1999999 AND ART.ARTNUM = AM01.USRCNT03 AND ART.NUMSUU > 0), 0) / 5678.0), 6)
                        THEN 'Cumple'
                        ELSE 'NoCumple'
                        END)
                    ELSE 'NoAplica'
                    END AS DR2002_7 
                ,CASE 
                    WHEN
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTCNVFAC2 = '0')
                        THEN
                        (CASE
                            WHEN AM01.ARTGRP04 = '99'
                        THEN 'Cumple'
                        ELSE 'NoCumple'
                        END)
                    WHEN
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0')
                        THEN 
                        (CASE 
                            WHEN AM01.ARTCNVFAC2 = (SD.DESCRIPCION * ISNULL(AM01.NUMSUU,1)/1000.00)
                        THEN 'Cumple'
                        ELSE 'NoCumple'
                        END)
                ELSE 'NoAplica' 
                END AS DR2002_8
                ,CASE
                        WHEN
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0')
                        THEN
                        (CASE 
                            WHEN ARTCNVFAC2 = '0' 
                            THEN 'Cumple'
                            ELSE 'NoCumple'
                        END)
                        ELSE 'NoAplica' 
                        END AS DR2002_9
                ,CASE 
                        WHEN 
                            AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7'
                            AND AM01.ARTLNKNUM3_1_2 = 'AF'
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND ((AM01.ARTCNVFAC3 = 0 AND AM01.ARTGRP04 = '99') OR (AM01.ARTCNVFAC3 = '5678' AND AM01.ARTGRP04 <> '99'))
                        THEN 'Cumple'
                        WHEN 
                            AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7'
                            AND AM01.ARTLNKNUM3_1_2 = 'AF'
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND ((AM01.ARTCNVFAC3 = '0' AND AM01.ARTGRP04 <> '99') OR (AM01.ARTCNVFAC3 <> '5678' AND AM01.ARTGRP04 = '99') OR (AM01.ARTCNVFAC3 = '5678' AND AM01.ARTGRP04 = '99') OR (AM01.ARTCNVFAC3 <> '5678' AND AM01.ARTGRP04 <> '99') OR (AM01.ARTCNVFAC3 <> '0' AND AM01.ARTGRP04 = '99') OR (AM01.ARTCNVFAC3 <> '0' AND AM01.ARTGRP04 <> '99'))
                        THEN 'NoCumple'
                        ELSE 'NoAplica'
                        END AS DR2002_10
                ,CASE
                        WHEN
                            (AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7' 
                            AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND AM01.MIXART1 = '0'
                            AND ((AM01.ARTCNVFAC4 = '1' AND AM01.ARTCNVFAC5 = '1' AND AM01.ARTGRP04 <> '99') OR (AM01.ARTCNVFAC4 = '0' AND AM01.ARTCNVFAC5 = '0' AND AM01.ARTGRP04 = '99')))
                        THEN 'Cumple'
                        WHEN
                            (AM01.EFTDAT = '1999999' 
                            AND AM01.ARTTYP = '1' 
                            AND AM01.ARTCLSCOD = '7' 
                            AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                            AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            AND AM01.MIXART1 = '0'
                            AND ((AM01.ARTCNVFAC4 <> '1' AND AM01.ARTCNVFAC5 = '1' AND AM01.ARTGRP04 = '99') OR (AM01.ARTCNVFAC4 <> '1' AND AM01.ARTCNVFAC5 = '1' AND AM01.ARTGRP04 <> '99') OR (AM01.ARTCNVFAC4 = '1' AND AM01.ARTCNVFAC5 <> '1' AND AM01.ARTGRP04 <> '99') OR (AM01.ARTCNVFAC4 = '1' AND AM01.ARTCNVFAC5 <> '1' AND AM01.ARTGRP04 = '99') OR (AM01.ARTCNVFAC4 <> '0' AND AM01.ARTCNVFAC5 = '0' AND AM01.ARTGRP04 <> '99') 
                            OR (AM01.ARTCNVFAC4 = '0' AND AM01.ARTCNVFAC5 = '0' AND AM01.ARTGRP04 <> '99') OR (AM01.ARTCNVFAC4 <> '0' AND AM01.ARTCNVFAC5 = '0' AND AM01.ARTGRP04 <> '99') OR (AM01.ARTCNVFAC4 = '0' AND AM01.ARTCNVFAC5 <> '0' AND AM01.ARTGRP04 = '99') OR (AM01.ARTCNVFAC4 <> '0' AND AM01.ARTCNVFAC5 <> '0' AND AM01.ARTGRP04 = '99')))
                            THEN 'NoCumple' 
                        ELSE 'NoAplica' 
                        END AS DR2002_11
                ,CASE
                        WHEN
                        (AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND AM01.ARTLNKNUM3_1_2 = 'AF' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.NUMSUU = '1')
                        THEN
                        (CASE 
                            WHEN AM01.ARTCNVFAC4 = ROUND(
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU1),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART1), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU2),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART2), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU3),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART3), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU4),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART4), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU5),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART5), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU6),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART6), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRINT02),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRINT01), 1))
                            +
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRINT04),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRINT03), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRDEC01),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRINT05), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRDEC03),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRDEC02), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRDEC05),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRDEC04), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRCNT04),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRCNT03), 1)),2)
                        AND 
                            AM01.ARTCNVFAC5 = ROUND(
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU1),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART1), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU2),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART2), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU3),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART3), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU4),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART4), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU5),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART5), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.MIXSUU6),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.MIXART6), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRINT02),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRINT01), 1))
                            +
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRINT04),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRINT03), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRDEC01),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRINT05), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRDEC03),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRDEC02), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRDEC05),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRDEC04), 1))
                            + 
                            (ISNULL(CONVERT(DECIMAL (7,2), AM01.USRCNT04),0) / ISNULL((SELECT TOP 1 CONVERT(DECIMAL (7,2), ART.NUMSUU) FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS ART
                            WHERE ART.EFTDAT = '1999999' AND ART.ARTCLSCOD = '7' AND ART.ARTTYP = '1' AND ART.SPRCOD <> 'S' AND ART.ARTNUM = AM01.USRCNT03), 1)),2)
                        THEN 'Cumple'
                        ELSE 'NoCumple'
                        END)
                ELSE 'NoAplica' 
                END AS DR2002_12

    FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS AM01
    LEFT JOIN [dbo].[EBX_EC_BASIS__SD2002] AS SD
    ON AM01.ARTGRP04 = SD.SD2002_ARTGRP04;

    --UPDATE CUMPLE SUBREGRA 2
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_2 = 'Cumple'
    WHERE EFTDAT = '1999999' 
        AND ARTTYP = '1' 
        AND ARTCLSCOD = '7' 
        AND ARTLNKNUM3_1_2 = 'AF' 
        AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
        AND MIXART1 = '0'
        AND NUMSUU = '1'
        AND ISNUMERIC(SUBSTRING(LTRIM(RTRIM(ARTNAM)), LEN(LTRIM(RTRIM(ARTNAM))) - 1, 2)) = 0;

    --UPDATE CUMPLE SUBREGRA 6 
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_6 = 'Cumple'
    WHERE EFTDAT = '1999999' 
        AND ARTTYP = '1' 
        AND ARTCLSCOD = '7' 
        AND ARTLNKNUM3_1_2 = 'AF' 
        AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
        AND MIXART1 = '0'
        AND ARTCNVFAC1 = ROUND((SELECT DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD WHERE SD.SD2002_ARTGRP04 = [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC].ARTGRP04) * ISNULL(NUMSUU,1)/5678.00, 4);

    --UPDATE CUMPLE SUBREGRA 6 
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_6 = 'Cumple'
    WHERE EFTDAT = '1999999' 
        AND ARTTYP = '1' 
        AND ARTCLSCOD = '7' 
        AND ARTLNKNUM3_1_2 = 'AF' 
        AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
        AND MIXART1 = '0'
        AND ARTCNVFAC1 = ROUND((SELECT DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD WHERE SD.SD2002_ARTGRP04 = [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC].ARTGRP04) * ISNULL(NUMSUU,1)/5678.00, 6);
        
    --UPDATE CUMPLE SUBREGRA 7 ARREDONDAMENTO PARA 4
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_7 = 'Cumple'
    WHERE EFTDAT = '1999999' 
        AND ARTTYP = '1' 
        AND ARTCLSCOD = '7' 
        AND ARTLNKNUM3_1_2 = 'AF' 
        AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
        AND MIXART1 <> '0'
        AND ARTGRP04 NOT IN ('98', '99')
        AND ARTCNVFAC1 = ROUND((SELECT DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD WHERE SD.SD2002_ARTGRP04 = [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC].ARTGRP04) * (ISNULL(MIXSUU1,0)
            +ISNULL(MIXSUU2,0)
            +ISNULL(MIXSUU3,0)
            +ISNULL(MIXSUU4,0)
            +ISNULL(MIXSUU5,0)
            +ISNULL(MIXSUU6,0)
            +ISNULL(USRINT02,0)
            +ISNULL(USRINT04,0)
            +ISNULL(USRDEC01,0)
            +ISNULL(USRDEC03,0)
            +ISNULL(USRDEC05,0)
            +ISNULL(USRCNT04,0))/5678, 4);

    --UPDATE CUMPLE SUBREGRA 7 ARREDONDAMENTO PARA 6
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_7 = 'Cumple'
    WHERE EFTDAT = '1999999' 
        AND ARTTYP = '1' 
        AND ARTCLSCOD = '7' 
        AND ARTLNKNUM3_1_2 = 'AF' 
        AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
        AND MIXART1 <> '0'
        AND ARTGRP04 NOT IN ('98', '99')
        AND ARTCNVFAC1 = ROUND((SELECT DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD WHERE SD.SD2002_ARTGRP04 = [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC].ARTGRP04) * (ISNULL(MIXSUU1,0)
            +ISNULL(MIXSUU2,0)
            +ISNULL(MIXSUU3,0)
            +ISNULL(MIXSUU4,0)
            +ISNULL(MIXSUU5,0)
            +ISNULL(MIXSUU6,0)
            +ISNULL(USRINT02,0)
            +ISNULL(USRINT04,0)
            +ISNULL(USRDEC01,0)
            +ISNULL(USRDEC03,0)
            +ISNULL(USRDEC05,0)
            +ISNULL(USRCNT04,0))/5678, 6);
    
    -- UPDATE SUBREGRA 7 ARREDONDAMENTO 4
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_7 = 'Cumple'
    WHERE EFTDAT = '1999999' 
        AND ARTTYP = '1' 
        AND ARTCLSCOD = '7' 
        AND ARTLNKNUM3_1_2 = 'AF' 
        AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
        AND MIXART1 <> '0'
        AND ARTGRP04 IN ('98', '99')
        AND NUMSUU <> '1'
        AND ARTCNVFAC1 = ROUND(NUMSUU * (SELECT DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD WHERE SD.SD2002_ARTGRP04 = [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC].ARTGRP04) / 5678.00, 4);

    -- UPDATE SUBREGRA 7 ARREDONDAMENTO 6
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_7 = 'Cumple'
    WHERE EFTDAT = '1999999' 
        AND ARTTYP = '1' 
        AND ARTCLSCOD = '7' 
        AND ARTLNKNUM3_1_2 = 'AF' 
        AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
        AND MIXART1 <> '0'
        AND ARTGRP04 IN ('98', '99')
        AND NUMSUU <> '1'
        AND ARTCNVFAC1 = ROUND(NUMSUU * (SELECT DESCRIPCION FROM [dbo].[EBX_EC_BASIS__SD2002] AS SD WHERE SD.SD2002_ARTGRP04 = [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC].ARTGRP04) / 5678.00, 6);

    --UPDATE DATARULES TERMINADO
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple'
    WHERE 
        DataRules_GR_DR2002_DR2002_1  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_2  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_3  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_4  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_5  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_6  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_7  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_8  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_9  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_10  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_11  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_12  = 'NoCumple';

    --UPDATE DATARULES TERMINADO NOAPLICA
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC]
    SET DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado  = 'NoAplica'
    WHERE DataRules_GR_DR2002_DR2002_1  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_2  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_3  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_4  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_5  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_6  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_7  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_8  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_9  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_10  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_11  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_12  = 'NoAplica';   
    
    /* DR2002 TONICORP*/
    INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC]
            ([T_LAST_USER_ID]
            ,[T_CREATOR_ID]
            ,[T_CREATION_DATE]
            ,[T_LAST_WRITE]
            ,[DR2002_TON_EC_ID]
            ,[EFTDAT]
            ,[EFTDATD]
            ,[ARTTYP]
            ,[ARTCLSCOD]
            ,[SPRCOD]
            ,[ARTGRP3]
            ,[ARTNUM]
            ,[EFRDAT]
            ,[EFRDATD]
            ,[NUMSUU]
            ,[UNIMSRUNI]
            ,[UNIMSRSUU]
            ,[DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado]
            ,[DataRules_GR_DR2002_DR2002_1]
            ,[DataRules_GR_DR2002_DR2002_2])
                    SELECT USER
                    ,USER
                    ,GETDATE()
                    ,0 
                    ,row_number() OVER (order by AM01.ARTNUM)
                    ,AM01.EFTDAT
                    ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12))
                    ,AM01.ARTTYP
                    ,AM01.ARTCLSCOD
                    ,AM01.SPRCOD
                    ,AM01.ARTGRP3
                    ,AM01.ARTNUM
                    ,AM01.EFRDAT
                    ,TRY_CONVERT(DATE, RIGHT(AM01.EFRDAT, 6), 12)
                    ,AM01.NUMSUU
                    ,AM01.UNIMSRUNI
                    ,AM01.UNIMSRSUU
                    ,'Cumple'
                    ,CASE 
                            WHEN 
                                (AM01.EFTDAT = '1999999' 
                                AND AM01.ARTTYP = '1' 
                                AND AM01.ARTCLSCOD = '7' 
                                AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                                AND ((AM01.NUMSUU = '1' AND AM01.UNIMSRUNI = 'UN') OR (AM01.NUMSUU <> '1' AND AM01.UNIMSRUNI = 'PQ')))
                            THEN 'Cumple'
                            WHEN 
                                (AM01.EFTDAT = '1999999' 
                                AND AM01.ARTTYP = '1' 
                                AND AM01.ARTCLSCOD = '7' 
                                AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                                AND ((AM01.NUMSUU = '1' AND AM01.UNIMSRUNI <> 'UN') OR (AM01.NUMSUU <> '1' AND AM01.UNIMSRUNI <> 'PQ')))
                            THEN 'NoCumple'
                            ELSE 'NoAplica' 
                            END AS DR2002_T_1
                    ,CASE 
                            WHEN 
                                AM01.EFTDAT = '1999999' 
                                AND AM01.ARTTYP = '1' 
                                AND AM01.ARTCLSCOD = '7'
                                AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                            THEN
                            (CASE
                                WHEN AM01.UNIMSRSUU = 'UN'
                                THEN 'Cumple'
                                ELSE 'NoCumple'
                            END)
                            ELSE 'NoAplica'
                            END AS DR2002_T_2

    FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_TON_EC] AS AM01
    --UPDATE DATARULES TERMINADO
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC]
    SET DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple'
    WHERE 
        DataRules_GR_DR2002_DR2002_1  = 'NoCumple' 
        OR DataRules_GR_DR2002_DR2002_2  = 'NoCumple';

    --UPDATE DATARULES TERMINADO NOAPLICA       
    UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC]
    SET DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado  = 'NoAplica'
    WHERE DataRules_GR_DR2002_DR2002_1  = 'NoAplica'
        AND DataRules_GR_DR2002_DR2002_2  = 'NoAplica';

          
/* DR2009 BEBIDAS*/
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE] 
           ,[DR2009_BEB_EC_ID]
           ,[EFTDAT] 
           ,[EFTDATD] 
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[ARTLNKNUM3_6_2] 
           ,[SPRCOD] 
           ,[ARTGRP02] 
           ,[ARTGRP09] 
           ,[ARTNUM] 
           ,[DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado])
                SELECT USER 
                ,USER 
                ,GETDATE()
                ,0 
                ,row_number() OVER (order by AM01.ARTNUM) 
                ,AM01.EFTDAT 
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.ARTLNKNUM3_6_2
                ,AM01.SPRCOD
                ,AM01.ARTGRP02
                ,AM01.ARTGRP09
                ,AM01.ARTNUM
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP02 = SD.SD2009_ARTGRP02
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.SD2009_ARTGRP09,';'))
                        AND AM01.ARTLNKNUM3_6_2 <> '99'
                        AND AM01.ARTGRP02 <> '99'
                        AND AM01.ARTGRP09 <> '99'
                    THEN 'Cumple'
                    WHEN 
                        (AM01.EFTDAT <> '1999999' 
                        OR AM01.ARTTYP <> '1' 
                        OR AM01.ARTCLSCOD <> '7' 
                        OR (AM01.SPRCOD IS NOT NULL OR TRIM(AM01.SPRCOD) <> '')
                        OR TRIM(AM01.SPRCOD) <> ''
                        AND AM01.ARTGRP09 NOT IN ('GH','EU','EC','CS','EI','DD','CR','AK','GU','GK','GG','GR','FK','AJ','DK','AQ','DO','GQ','BX','AR','BN','CY','FR','ET','GA','DQ','AE','EW','ES','FZ','GP','AA'))
                        AND ((NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2009 SD
                        WHERE SD.SD2009_ARTGRP02 = ARTGRP02 
                        AND SD.SD2009_ARTGRP09 = ARTGRP09))
                        OR ARTGRP02 = '99' OR ARTGRP09 = '99' OR ARTLNKNUM3_6_2 ='99')
                    THEN 'NoCumple'
                    END AS DR2009

FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC AS AM01
LEFT JOIN EBX_EC_BASIS__SD2009 AS SD ON SD.SD2009_ARTGRP02 = AM01.ARTGRP02;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC] 
SET DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoAplica'
WHERE ARTGRP09 IN ('GH','EU','EC','CS','EI','DD','CR','AK','GU','GK','GG','GR','FK','AJ','DK','AQ','DO','GQ','BX','AR','BN','CY','FR','ET','GA','DQ','AE','EW','ES','FZ','GP','AA')
OR EFTDAT <> '1999999' OR ARTTYP <> '1' OR ARTCLSCOD <> '7'  OR SPRCOD = 'S';

/* DR2009 TONI*/
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE] 
           ,[DR2009_TON_EC_ID]
           ,[EFTDAT] 
           ,[EFTDATD] 
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[ARTLNKNUM3_6_2] 
           ,[SPRCOD] 
           ,[ARTGRP02] 
           ,[ARTGRP09] 
           ,[ARTNUM] 
           ,[DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado])
                SELECT USER 
                ,USER 
                ,GETDATE()
                ,0 
                ,row_number() OVER (order by AM01.ARTNUM) 
                ,AM01.EFTDAT 
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.ARTLNKNUM3_6_2
                ,AM01.SPRCOD
                ,AM01.ARTGRP02
                ,AM01.ARTGRP09
                ,AM01.ARTNUM
                ,CASE
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP02 = SD.SD2009_ARTGRP02
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.SD2009_ARTGRP09,';'))
                        AND AM01.ARTLNKNUM3_6_2 <> '99'
                        AND AM01.ARTGRP02 <> '99'
                        AND AM01.ARTGRP09 <> '99'
                    THEN 'Cumple'
                    WHEN 
                        (AM01.EFTDAT <> '1999999' 
                        OR AM01.ARTTYP <> '1' 
                        OR AM01.ARTCLSCOD <> '7' 
                        OR (AM01.SPRCOD IS NOT NULL OR TRIM(AM01.SPRCOD) <> '')
                        OR TRIM(AM01.SPRCOD) <> ''
                        AND AM01.ARTGRP09 NOT IN ('GH','EU','EC','CS','EI','DD','CR','AK','GU','GK','GG','GR','FK','AJ','DK','AQ','DO','GQ','BX','AR','BN','CY','FR','ET','GA','DQ','AE','EW','ES','FZ','GP','AA'))
                        AND ((NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2009 SD
                        WHERE SD.SD2009_ARTGRP02 = ARTGRP02 
                        AND SD.SD2009_ARTGRP09 = ARTGRP09))
                        OR ARTGRP02 = '99' OR ARTGRP09 = '99' OR ARTLNKNUM3_6_2 ='99')
                    THEN 'NoCumple'
                    END AS DR2009_T
FROM EBX_EC_BASIS_ARTICULOS__AM01_TON_EC AS AM01
LEFT JOIN EBX_EC_BASIS__SD2009 AS SD ON SD.SD2009_ARTGRP02 = AM01.ARTGRP02;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC] 
SET DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoAplica'
WHERE ARTGRP09 IN ('GH','EU','EC','CS','EI','DD','CR','AK','GU','GK','GG','GR','FK','AJ','DK','AQ','DO','GQ','BX','AR','BN','CY','FR','ET','GA','DQ','AE','EW','ES','FZ','GP','AA')
OR EFTDAT <> '1999999' OR ARTTYP <> '1' OR ARTCLSCOD <> '7'  OR SPRCOD = 'S';

/* 2010 BEBIDAS */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2010_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP01]
           ,[ARTGRP02]
           ,[ARTGRP07]
           ,[ARTGRP09]
           ,[ARTNUM]
           ,[DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas]
           ,[DataRules_DR2010_1]
           ,[DataRules_DR2010_2]
           ,[DataRules_DR2010_3]
           ,[DataRules_DR2010_4]
           ,[DataRules_DR2010_5]
           ,[DataRules_DR2010_6]
           ,[DataRules_DR2010_7]
           ,[DataRules_DR2010_8]
           ,[DataRules_DR2010_9]
           ,[DataRules_DR2010_10]
           ,[DataRules_DR2010_11]
           ,[DataRules_DR2010_12]
           ,[DataRules_DR2010_13]
           ,[DataRules_DR2010_14]
           ,[DataRules_DR2010_15]
           ,[DataRules_DR2010_16]
           ,[DataRules_DR2010_17]
           ,[DataRules_DR2010_18])
           SELECT USER 
                ,USER 
                ,GETDATE()
                ,0 
                ,row_number() OVER (order by AM01.ARTNUM) 
                ,AM01.EFTDAT 
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.SPRCOD
                ,AM01.ARTGRP01
                ,AM01.ARTGRP02
                ,AM01.ARTGRP07
                ,AM01.ARTGRP09
                ,AM01.ARTNUM
                ,'Cumple'
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CM'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))
                        OR (AM01.ARTGRP02 = 'DV'
                        AND AM01.ARTGRP07 = 'EW'))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CM'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                        OR (AM01.ARTGRP02 <> 'DV'
                        AND AM01.ARTGRP07 <> 'EW'))
                    THEN 'NoCumple'
                    END AS DR2010_1
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AC'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AC'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_2
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CN'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CN'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_3
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CS'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CS'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_4
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CH'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CH'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_5
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CO'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CO'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_6
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AY'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AY'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_7
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AZ'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AZ'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_8
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CP'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CP'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_9
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = '98'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = '98'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_10
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BK'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BK'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_11
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AI'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AI'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                        END AS DR2010_12
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BV'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BV'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_13
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BR'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BR'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_14
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AX'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AX'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_15
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CQ'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CQ'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_16
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CR'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CR'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_17
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BS'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BS'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_18

FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC AS AM01
LEFT JOIN EBX_EC_BASIS__SD2010 AS SD ON SD.ARTGRP01 = AM01.ARTGRP01;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_2 = 'Cumple'
WHERE EFTDAT = '1999999'
    AND ARTTYP = '1' 
    AND ARTCLSCOD = '7'
    AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
    AND ARTGRP01 = 'AC'
    AND ARTGRP07 = 'AF'
    AND ARTGRP02 = 'BX'
    AND ARTGRP09 = 'DV' ;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_1 = 'NoAplica'
WHERE DataRules_DR2010_1 IS NULL;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_2 = 'NoAplica'
WHERE DataRules_DR2010_2 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_3 = 'NoAplica'
WHERE DataRules_DR2010_3 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_4 = 'NoAplica'
WHERE DataRules_DR2010_4 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_5 = 'NoAplica'
WHERE DataRules_DR2010_5 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_6 = 'NoAplica'
WHERE DataRules_DR2010_6 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_7 = 'NoAplica'
WHERE DataRules_DR2010_7 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_8 = 'NoAplica'
WHERE DataRules_DR2010_8 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_9 = 'NoAplica'
WHERE DataRules_DR2010_9 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_10 = 'NoAplica'
WHERE DataRules_DR2010_10 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_11 = 'NoAplica'
WHERE DataRules_DR2010_11 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_12 = 'NoAplica'
WHERE DataRules_DR2010_12 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_13 = 'NoAplica'
WHERE DataRules_DR2010_13 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_14 = 'NoAplica'
WHERE DataRules_DR2010_14 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_15 = 'NoAplica'
WHERE DataRules_DR2010_15 IS NULL;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_16 = 'NoAplica'
WHERE DataRules_DR2010_16 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_17 = 'NoAplica'
WHERE DataRules_DR2010_17 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_18 = 'NoAplica'
WHERE DataRules_DR2010_18 IS NULL; 

--UPDATE DATARULES TERMINADO
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'NoCumple'
WHERE DataRules_DR2010_1  = 'NoCumple' 
    OR DataRules_DR2010_2  = 'NoCumple' 
    OR DataRules_DR2010_3  = 'NoCumple' 
    OR DataRules_DR2010_4  = 'NoCumple' 
    OR DataRules_DR2010_5  = 'NoCumple' 
    OR DataRules_DR2010_6  = 'NoCumple' 
    OR DataRules_DR2010_7  = 'NoCumple' 
    OR DataRules_DR2010_8  = 'NoCumple' 
    OR DataRules_DR2010_9  = 'NoCumple' 
    OR DataRules_DR2010_10  = 'NoCumple' 
    OR DataRules_DR2010_11  = 'NoCumple' 
    OR DataRules_DR2010_12  = 'NoCumple'
    OR DataRules_DR2010_13  = 'NoCumple'
    OR DataRules_DR2010_14  = 'NoCumple'
    OR DataRules_DR2010_15  = 'NoCumple'
    OR DataRules_DR2010_16  = 'NoCumple'
    OR DataRules_DR2010_17  = 'NoCumple'
    OR DataRules_DR2010_18  = 'NoCumple';

--UPDATE DATARULES TERMINADO NOAPLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
SET DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas  = 'NoAplica'
WHERE DataRules_DR2010_1  = 'NoAplica'
    AND DataRules_DR2010_2  = 'NoAplica'
    AND DataRules_DR2010_3  = 'NoAplica'
    AND DataRules_DR2010_4  = 'NoAplica'
    AND DataRules_DR2010_5  = 'NoAplica'
    AND DataRules_DR2010_6  = 'NoAplica'
    AND DataRules_DR2010_7  = 'NoAplica'
    AND DataRules_DR2010_8  = 'NoAplica'
    AND DataRules_DR2010_9  = 'NoAplica'
    AND DataRules_DR2010_10  = 'NoAplica'
    AND DataRules_DR2010_11  = 'NoAplica'
    AND DataRules_DR2010_12  = 'NoAplica' 
    AND DataRules_DR2010_13  = 'NoAplica'
    AND DataRules_DR2010_14  = 'NoAplica'
    AND DataRules_DR2010_15  = 'NoAplica'
    AND DataRules_DR2010_16  = 'NoAplica'
    AND DataRules_DR2010_17  = 'NoAplica'
    AND DataRules_DR2010_18  = 'NoAplica';

-- REMOVE DUPLICATES
WITH ROW_NUM_CTE AS 
    (
        SELECT *, 
        ROW_NUMBER() OVER (PARTITION BY ARTNUM, EFTDAT, ARTCLSCOD, SPRCOD, ARTTYP, ARTGRP01
        ORDER BY DR2010_BEB_EC_ID) AS ROW_NUM
        FROM [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC]
    )
    DELETE FROM ROW_NUM_CTE
    WHERE ROW_NUM > 1;

/* 2010 TONI */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2010_TON_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP01]
           ,[ARTGRP02]
           ,[ARTGRP07]
           ,[ARTGRP09]
           ,[ARTNUM]
           ,[DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni]
           ,[DataRules_DR2010_1]
           ,[DataRules_DR2010_2]
           ,[DataRules_DR2010_3]
           ,[DataRules_DR2010_4]
           ,[DataRules_DR2010_5]
           ,[DataRules_DR2010_6]
           ,[DataRules_DR2010_7]
           ,[DataRules_DR2010_8]
           ,[DataRules_DR2010_9]
           ,[DataRules_DR2010_10]
           ,[DataRules_DR2010_11]
           ,[DataRules_DR2010_12]
           ,[DataRules_DR2010_13]
           ,[DataRules_DR2010_14]
           ,[DataRules_DR2010_15]
           ,[DataRules_DR2010_16]
           ,[DataRules_DR2010_17]
           ,[DataRules_DR2010_18])
           SELECT USER 
                ,USER 
                ,GETDATE()
                ,0 
                ,row_number() OVER (order by AM01.ARTNUM) 
                ,AM01.EFTDAT 
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.SPRCOD
                ,AM01.ARTGRP01
                ,AM01.ARTGRP02
                ,AM01.ARTGRP07
                ,AM01.ARTGRP09
                ,AM01.ARTNUM
                ,'Cumple'
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CM'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))
                        OR (AM01.ARTGRP02 = 'DV'
                        AND AM01.ARTGRP07 = 'EW'))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CM'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                        OR (AM01.ARTGRP02 <> 'DV'
                        AND AM01.ARTGRP07 <> 'EW'))
                    THEN 'NoCumple'
                    END AS DR2010_1
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AC'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AC'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_2
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CN'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CN'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_3
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CS'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CS'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_4
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CH'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CH'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_5
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CO'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CO'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_6
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AY'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AY'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_7
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AZ'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AZ'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_8
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CP'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CP'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_9
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = '98'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = '98'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_10
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BK'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BK'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';')))))
                    THEN 'NoCumple'
                    END AS DR2010_11
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AI'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AI'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                        END AS DR2010_12
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BV'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BV'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_13
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BR'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BR'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_14
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AX'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'AX'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_15
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CQ'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CQ'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_16
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CR'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'CR'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_17
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BS'
                        AND (EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';'))))
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999'
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7'
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP01 = 'BS'
                        AND (NOT EXISTS (
                        SELECT 1 
                        FROM EBX_EC_BASIS__SD2010 SD
                        WHERE
						AM01.ARTGRP01 = SD.ARTGRP01
                        AND (AM01.ARTGRP02 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP02,';'))
                        AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP07,';'))
                        AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.ARTGRP09,';')))))
                        THEN 'NoCumple'
                    END AS DR2010_18

FROM EBX_EC_BASIS_ARTICULOS__AM01_TON_EC AS AM01
LEFT JOIN EBX_EC_BASIS__SD2010 AS SD ON SD.ARTGRP01 = AM01.ARTGRP01;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_2 = 'Cumple'
WHERE EFTDAT = '1999999'
    AND ARTTYP = '1' 
    AND ARTCLSCOD = '7'
    AND (SPRCOD IS NULL OR TRIM(SPRCOD) = '')
    AND ARTGRP01 = 'AC'
    AND ARTGRP07 = 'AF'
    AND ARTGRP02 = 'BX'
    AND ARTGRP09 = 'DV' ;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_1 = 'NoAplica'
WHERE DataRules_DR2010_1 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_2 = 'NoAplica'
WHERE DataRules_DR2010_2 IS NULL ;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_3 = 'NoAplica'
WHERE DataRules_DR2010_3 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_4 = 'NoAplica'
WHERE DataRules_DR2010_4 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_5 = 'NoAplica'
WHERE DataRules_DR2010_5 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_6 = 'NoAplica'
WHERE DataRules_DR2010_6 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_7 = 'NoAplica'
WHERE DataRules_DR2010_7 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_8 = 'NoAplica'
WHERE DataRules_DR2010_8 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_9 = 'NoAplica'
WHERE DataRules_DR2010_9 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_10 = 'NoAplica'
WHERE DataRules_DR2010_10 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_11 = 'NoAplica'
WHERE DataRules_DR2010_11 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_12 = 'NoAplica'
WHERE DataRules_DR2010_12 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_13 = 'NoAplica'
WHERE DataRules_DR2010_13 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_14 = 'NoAplica'
WHERE DataRules_DR2010_14 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_15 = 'NoAplica'
WHERE DataRules_DR2010_15 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_16 = 'NoAplica'
WHERE DataRules_DR2010_16 IS NULL ;

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_17 = 'NoAplica'
WHERE DataRules_DR2010_17 IS NULL; 

UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_18 = 'NoAplica'
WHERE DataRules_DR2010_18 IS NULL; 

--UPDATE DATARULES TERMINADO
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'NoCumple'
WHERE 
    DataRules_DR2010_1  = 'NoCumple' 
    OR DataRules_DR2010_2  = 'NoCumple' 
    OR DataRules_DR2010_3  = 'NoCumple' 
    OR DataRules_DR2010_4  = 'NoCumple' 
    OR DataRules_DR2010_5  = 'NoCumple' 
    OR DataRules_DR2010_6  = 'NoCumple' 
    OR DataRules_DR2010_7  = 'NoCumple' 
    OR DataRules_DR2010_8  = 'NoCumple' 
    OR DataRules_DR2010_9  = 'NoCumple' 
    OR DataRules_DR2010_10  = 'NoCumple' 
    OR DataRules_DR2010_11  = 'NoCumple' 
    OR DataRules_DR2010_12  = 'NoCumple'
    OR DataRules_DR2010_13  = 'NoCumple'
    OR DataRules_DR2010_14  = 'NoCumple'
    OR DataRules_DR2010_15  = 'NoCumple'
    OR DataRules_DR2010_16  = 'NoCumple'
    OR DataRules_DR2010_17  = 'NoCumple'
    OR DataRules_DR2010_18  = 'NoCumple';

--UPDATE DATARULES TERMINADO NOAPLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
SET DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni  = 'NoAplica'
WHERE DataRules_DR2010_1  = 'NoAplica'
    AND DataRules_DR2010_2  = 'NoAplica'
    AND DataRules_DR2010_3  = 'NoAplica'
    AND DataRules_DR2010_4  = 'NoAplica'
    AND DataRules_DR2010_5  = 'NoAplica'
    AND DataRules_DR2010_6  = 'NoAplica'
    AND DataRules_DR2010_7  = 'NoAplica'
    AND DataRules_DR2010_8  = 'NoAplica'
    AND DataRules_DR2010_9  = 'NoAplica'
    AND DataRules_DR2010_10  = 'NoAplica'
    AND DataRules_DR2010_11  = 'NoAplica'
    AND DataRules_DR2010_12  = 'NoAplica' 
    AND DataRules_DR2010_13  = 'NoAplica'
    AND DataRules_DR2010_14  = 'NoAplica'
    AND DataRules_DR2010_15  = 'NoAplica'
    AND DataRules_DR2010_16  = 'NoAplica'
    AND DataRules_DR2010_17  = 'NoAplica'
    AND DataRules_DR2010_18  = 'NoAplica';

--REMOVE DUPLICATES
WITH ROW_NUM_CTE AS 
(
    SELECT *, 
    ROW_NUMBER() OVER (PARTITION BY ARTNUM, EFTDAT, ARTCLSCOD, SPRCOD, ARTTYP, ARTGRP01
    ORDER BY DR2010_TON_EC_ID) AS ROW_NUM
    FROM [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC]
)
DELETE FROM ROW_NUM_CTE
WHERE ROW_NUM > 1;

/* 2001 BEBIDAS */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2001_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[ARTLNKNUM3_6_2]
           ,[ARTLNKNUM3_1_2]
           ,[SPRCOD]
           ,[ARTGRP02]
           ,[ARTGRP03]
           ,[ARTGRP04]
           ,[ARTGRP05]
           ,[ARTGRP06]
           ,[ARTGRP09]
           ,[ARTNUM]
           ,[NUMSUU]
           ,[MIXART1]
           ,[ARTNAM]
           ,[DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado]
           ,[DataRules_GR_DR2001_DR2001_1]
           ,[DataRules_GR_DR2001_DR2001_2])
            SELECT USER 
            ,USER 
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM) 
            ,AM01.EFTDAT 
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.ARTLNKNUM3_6_2
            ,AM01.ARTLNKNUM3_1_2
            ,AM01.SPRCOD
            ,AM01.ARTGRP02
            ,AM01.ARTGRP03
            ,AM01.ARTGRP04
            ,AM01.ARTGRP05
            ,AM01.ARTGRP06
            ,AM01.ARTGRP09
            ,AM01.ARTNUM
            ,AM01.NUMSUU
            ,AM01.MIXART1
            ,AM01.ARTNAM
            ,'Cumple'
            ,CASE 
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTNAM LIKE ('%(' + CONVERT(VARCHAR, NUMSUU) + ')%')
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_09] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP09, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP09 = AM01.ARTGRP09
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_03] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP03, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP03 = AM01.ARTGRP03
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_04] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_05] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                    )
            THEN 'Cumple'
            WHEN
                AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTNAM NOT LIKE ('%(' + CONVERT(VARCHAR, NUMSUU) + ')%')
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_09] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP09, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP09 = AM01.ARTGRP09
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_03] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP03, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP03 = AM01.ARTGRP03
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_04] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2001_05] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                        WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                    ))
            THEN 'NoCumple'
            ELSE 'NoAplica'
            END AS DR2001_1
            ,CASE
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTNAM LIKE 'MIX%'
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTNAM NOT LIKE 'MIX%'
                THEN 'NoCumple'
                ELSE 'NoAplica'
            END AS DR2001_2

FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC AS AM01;

--UPDATE PRODUCTO TERMINADO NO CUMPLE 
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC]
SET DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoCumple'
WHERE DataRules_GR_DR2001_DR2001_1 = 'NoCumple'
OR DataRules_GR_DR2001_DR2001_2 = 'NoCumple';

-- UPDATE PRODUCTO TERMINADO NO APLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC]
SET DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoAplica'
WHERE DataRules_GR_DR2001_DR2001_1 = 'NoAplica'
AND DataRules_GR_DR2001_DR2001_2 = 'NoAplica';

/* 2001 TONI */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2001_TON_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[ARTLNKNUM3_6_2]
           ,[ARTLNKNUM3_1_2]
           ,[SPRCOD]
           ,[ARTGRP02]
           ,[ARTGRP03]
           ,[ARTGRP04]
           ,[ARTGRP05]
           ,[ARTGRP06]
           ,[ARTGRP09]
           ,[ARTNUM]
           ,[NUMSUU]
           ,[MIXART1]
           ,[ARTNAM]
           ,[DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni]
           ,[DataRules_GR_DR2001_DR2001_1]
           ,[DataRules_GR_DR2001_DR2001_2]  
           )
                SELECT USER 
                ,USER 
                ,GETDATE()
                ,0 
                ,row_number() OVER (order by AM01.ARTNUM) 
                ,AM01.EFTDAT 
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.ARTLNKNUM3_6_2
                ,AM01.ARTLNKNUM3_1_2
                ,AM01.SPRCOD
                ,AM01.ARTGRP02
                ,AM01.ARTGRP03
                ,AM01.ARTGRP04
                ,AM01.ARTGRP05
                ,AM01.ARTGRP06
                ,AM01.ARTGRP09
                ,AM01.ARTNUM
                ,AM01.NUMSUU
                ,AM01.MIXART1
                ,AM01.ARTNAM
                ,'Cumple'
                ,CASE 
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTLNKNUM3_1_2 = 'AT'
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTNAM LIKE ('%(' + CONVERT(VARCHAR, NUMSUU) + ')%')
                        AND EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_09] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP09, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP09 = AM01.ARTGRP09
                        )
                        AND EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_02] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                        )
                        AND EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_03] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP03, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP03 = AM01.ARTGRP03
                        )
                        AND EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_04] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                        )
                        AND EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_05] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                        )
                THEN 'Cumple'
                WHEN
                    AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTLNKNUM3_1_2 = 'AT'
                        AND AM01.MIXART1 = '0'
                        AND (AM01.ARTNAM NOT LIKE ('%(' + CONVERT(VARCHAR, NUMSUU) + ')%')
                        OR NOT EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_09] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP09, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP09 = AM01.ARTGRP09
                        )
                        OR NOT EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_02] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                        )
                        OR NOT EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_03] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP03, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP03 = AM01.ARTGRP03
                        )
                        OR NOT EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_04] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                        )
                        OR NOT EXISTS (
                            SELECT 1
                            FROM [dbo].[EBX_EC_BASIS__SD2001_05] AS SD
                            CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                            WHERE AM01.ARTNAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                        ))
                THEN 'NoCumple'
                ELSE 'NoAplica'
                END AS DR2001_1
                ,CASE
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTLNKNUM3_1_2 = 'AT'
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTNAM LIKE 'MIX%'
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTLNKNUM3_1_2 = 'AT'
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTNAM NOT LIKE 'MIX%'
                    THEN 'NoCumple'
                    ELSE 'NoAplica'
                END AS DR2001_2

FROM EBX_EC_BASIS_ARTICULOS__AM01_TON_EC AS AM01;

--UPDATE PRODUCTO TERMINADO NO CUMPLE 
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC]
SET DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoCumple'
WHERE DataRules_GR_DR2001_DR2001_1 = 'NoCumple'
OR DataRules_GR_DR2001_DR2001_2 = 'NoCumple';

-- UPDATE PRODUCTO TERMINADO NO APLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC]
SET DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoAplica'
WHERE DataRules_GR_DR2001_DR2001_1 = 'NoAplica'
AND DataRules_GR_DR2001_DR2001_2 = 'NoAplica';

/* DR2011 BEBIDAS*/
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2011_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[MIXART1]
           ,[ARTGRP03]
           ,[ARTNUM]
           ,[DataRules_DR2011_Sabor_Producto_Terminado_Beb]
           ,[DataRules_DR2011_1]
           ,[DataRules_DR2011_2])
            SELECT USER
            ,USER
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM)
            ,AM01.EFTDAT
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.SPRCOD
            ,AM01.MIXART1
            ,AM01.ARTGRP03
            ,AM01.ARTNUM
            ,'Cumple'
            ,CASE
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP03 IN ('99','98')
                    OR AM01.ARTGRP03 IS NULL
                    OR TRIM(AM01.ARTGRP03) = '')
                THEN 'NoCumple'
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP03 IN (SD.ARTGRP03)
                    AND AM01.ARTGRP03 NOT IN ('99','98')
                    AND AM01.ARTGRP03 IS NOT NULL 
                THEN 'Cumple'
                ELSE 'NoAplica'
            END AS DR2011_1
            ,CASE
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTGRP03 = '98'
                THEN 'Cumple'
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTGRP03 <> '98'
                THEN 'NoCumple'
                ELSE 'NoAplica'
            END AS DR2011_2

FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS AM01
LEFT JOIN [dbo].[EBX_EC_BASIS__SD2011] AS SD 
ON AM01.ARTGRP03 = SD.ARTGRP03;

--UPDATE PRODUCTO TERMINADO NO CUMPLE 
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC]
SET DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoCumple'
WHERE DataRules_DR2011_1 = 'NoCumple'
OR DataRules_DR2011_2 = 'NoCumple';

-- UPDATE PRODUCTO TERMINADO NO APLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC]
SET DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoAplica'
WHERE DataRules_DR2011_1 = 'NoAplica'
AND DataRules_DR2011_2 = 'NoAplica';

/* DR2011 TONI */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2011_TON_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[MIXART1]
           ,[ARTGRP03]
           ,[ARTNUM]
           ,[DataRules_DR2011_Sabor_Producto_Terminado_Ton]
           ,[DataRules_DR2011_1]
           ,[DataRules_DR2011_2])
            SELECT USER
            ,USER
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM)
            ,AM01.EFTDAT
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.SPRCOD
            ,AM01.MIXART1
            ,AM01.ARTGRP03
            ,AM01.ARTNUM
            ,'Cumple'
            ,CASE
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP03 IN ('99','98')
                    OR AM01.ARTGRP03 IS NULL
                    OR TRIM(AM01.ARTGRP03) = '')
                THEN 'NoCumple'
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP03 IN (SD.ARTGRP03)
                    AND AM01.ARTGRP03 NOT IN ('99','98')
                    AND AM01.ARTGRP03 IS NOT NULL 
                THEN 'Cumple'
                ELSE 'NoAplica'
            END AS DR2011_1
        ,CASE
            WHEN
                AM01.EFTDAT = '1999999'
                AND AM01.ARTTYP = '1'
                AND AM01.ARTCLSCOD = '7'
                AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                AND AM01.MIXART1 <> '0'
                AND AM01.ARTGRP03 = '98'
            THEN 'Cumple'
            WHEN
                AM01.EFTDAT = '1999999'
                AND AM01.ARTTYP = '1'
                AND AM01.ARTCLSCOD = '7'
                AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                AND AM01.MIXART1 <> '0'
                AND AM01.ARTGRP03 <> '98'
            THEN 'NoCumple'
            ELSE 'NoAplica'
        END AS DR2011_2

FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_TON_EC] AS AM01
LEFT JOIN [dbo].[EBX_EC_BASIS__SD2011] AS SD 
ON AM01.ARTGRP03 = SD.ARTGRP03;

--UPDATE PRODUCTO TERMINADO NO CUMPLE 
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC]
SET DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoCumple'
WHERE DataRules_DR2011_1 = 'NoCumple'
OR DataRules_DR2011_2 = 'NoCumple';

-- UPDATE PRODUCTO TERMINADO NO APLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC]
SET DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoAplica'
WHERE DataRules_DR2011_1 = 'NoAplica'
AND DataRules_DR2011_2 = 'NoAplica';

/* 2015 BEBIDAS */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2015_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[ARTLNKNUM3_1_2]
           ,[SPRCOD]
           ,[MIXART1]
           ,[ARTGRP01]
           ,[USRARE030E_12_5]
           ,[ARTNUM]
           ,[USRARE030E_17_5]
           ,[DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado])
            SELECT USER 
            ,USER 
            ,GETDATE() 
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM) 
            ,AM01.EFTDAT 
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.ARTLNKNUM3_1_2
            ,AM01.SPRCOD
            ,AM01.MIXART1 
            ,AM01.ARTGRP01 
            ,AM01.USRARE030E_12_5  
            ,AM01.ARTNUM
            ,AM01.USRARE030E_17_5
            ,CASE
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND (AM01.ARTLNKNUM3_1_2 = 'AT' OR AM01.ARTLNKNUM3_1_2 = 'AF')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP01 <> 'BR' OR AM01.ARTGRP01 <> 'BV' OR AM01.ARTGRP01 <> 'BJ')
                    AND AM01.USRARE030E_12_5 > '0'
                    AND AM01.USRARE030E_17_5 > '0'
                THEN 'Cumple'
                WHEN
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND (AM01.ARTLNKNUM3_1_2 = 'AT' OR AM01.ARTLNKNUM3_1_2 = 'AF')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP01 = 'BR' OR AM01.ARTGRP01 = 'BV' OR AM01.ARTGRP01 = 'BJ')
                    AND (AM01.USRARE030E_12_5 = '0' OR AM01.USRARE030E_12_5 IS NULL)
                    AND (AM01.USRARE030E_17_5 = '0' OR AM01.USRARE030E_17_5 IS NULL)
                THEN 'Cumple'
                WHEN
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND (AM01.ARTLNKNUM3_1_2 = 'AT' OR AM01.ARTLNKNUM3_1_2 = 'AF')
                    AND AM01.MIXART1 <> '0'
                    AND (AM01.USRARE030E_12_5 = '0' OR AM01.USRARE030E_12_5 IS NULL OR AM01.USRARE030E_12_5 > '0' )
                    AND (AM01.USRARE030E_17_5 = '0' OR AM01.USRARE030E_17_5 IS NULL OR AM01.USRARE030E_17_5 > '0')
                THEN 'Cumple'
                WHEN
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND (AM01.ARTLNKNUM3_1_2 = 'AT' OR AM01.ARTLNKNUM3_1_2 = 'AF')
                    AND (AM01.ARTGRP01 = 'BR'OR AM01.ARTGRP01 = 'BV' OR AM01.ARTGRP01 = 'BJ')
                    AND AM01.MIXART1 = '0'
                    AND AM01.USRARE030E_12_5 > '0'
                    AND AM01.USRARE030E_17_5 > '0'
                THEN 'NoCumple'
                WHEN
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND (AM01.ARTLNKNUM3_1_2 = 'AT' OR AM01.ARTLNKNUM3_1_2 = 'AF')
                    AND (AM01.ARTGRP01 <>'BR' OR AM01.ARTGRP01 <> 'BV' OR AM01.ARTGRP01 <> 'BJ')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.USRARE030E_12_5 = '0' OR AM01.USRARE030E_12_5 IS NULL)
                    AND (AM01.USRARE030E_17_5 = '0' OR AM01.USRARE030E_17_5 IS NULL)
                THEN 'NoCumple'
                ELSE 'NoAplica'
                END AS 'DR2015'

FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC AS AM01;
 
/* DR2021 BEBIDAS */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2021_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP04]
           ,[ARTNUM]
           ,[MIXART1]
           ,[DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado])
            SELECT USER
            ,USER
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM)
            ,AM01.EFTDAT
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.SPRCOD
            ,AM01.ARTGRP04
            ,AM01.ARTNUM
            ,AM01.MIXART1
            ,CASE 
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND EXISTS (SELECT 1 
                                FROM EBX_EC_BASIS__SD2002 AS SD
                                WHERE AM01.ARTGRP04 IN (SD2002_ARTGRP04)
                                AND AM01.ARTGRP04 <> '98'
                                AND AM01.ARTGRP04 <> '99')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP04 IS NULL OR TRIM(AM01.ARTGRP04) = '' OR AM01.ARTGRP04 = '99' OR AM01.ARTGRP04 = '98' OR
                    NOT EXISTS (SELECT 1 
                                FROM EBX_EC_BASIS__SD2002 AS SD
                                WHERE AM01.ARTGRP04 IN (SD2002_ARTGRP04)))
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                    AND EXISTS (SELECT 1 
                                FROM EBX_EC_BASIS__SD2002 AS SD
                                WHERE AM01.ARTGRP04 IN (SD2002_ARTGRP04)
                                AND AM01.ARTGRP04 <> '99')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTGRP04 = '99'
                THEN 'NoCumple'
                ELSE 'NoAplica'
            END AS DR2021
FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS AM01;

/* DR2021 TONI */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2021_TON_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP04]
           ,[ARTNUM]
           ,[MIXART1]
           ,[DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado])
            SELECT USER
            ,USER
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM)
            ,AM01.EFTDAT
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.SPRCOD
            ,AM01.ARTGRP04
            ,AM01.ARTNUM
            ,AM01.MIXART1
            ,CASE 
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND EXISTS (SELECT 1 
                                FROM EBX_EC_BASIS__SD2002 AS SD
                                WHERE AM01.ARTGRP04 IN (SD2002_ARTGRP04)
                                AND AM01.ARTGRP04 <> '98'
                                AND AM01.ARTGRP04 <> '99')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP04 IS NULL OR TRIM(AM01.ARTGRP04) = '' OR AM01.ARTGRP04 = '99' OR AM01.ARTGRP04 = '98' OR
                    NOT EXISTS (SELECT 1 
                                FROM EBX_EC_BASIS__SD2002 AS SD
                                WHERE AM01.ARTGRP04 IN (SD2002_ARTGRP04)))
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                    AND EXISTS (SELECT 1 
                                FROM EBX_EC_BASIS__SD2002 AS SD
                                WHERE AM01.ARTGRP04 IN (SD2002_ARTGRP04)
                                AND AM01.ARTGRP04 <> '99')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTGRP04 = '99'
                THEN 'NoCumple'
                ELSE 'NoAplica'
            END AS DR2021
FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_TON_EC] AS AM01;

/* DR2035 BEBIDAS */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2035_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[ARTLNKNUM3_1_2]
           ,[SPRCOD]
           ,[MIXART1]
           ,[ARTNUM]
           ,[ARTSHONAM]
           ,[ARTGRP02]
           ,[ARTGRP03]
           ,[ARTGRP04]
           ,[ARTGRP05]
           ,[ARTGRP09]
           ,[NUMSUU]
           ,[DataRules_DR2035_Descripcion_Corta_Producto_Terminado]
           ,[DataRules_DR2035_1]
           ,[DataRules_DR2035_2])
            SELECT USER 
            ,USER 
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM) 
            ,AM01.EFTDAT 
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.ARTLNKNUM3_1_2 
            ,AM01.SPRCOD
            ,AM01.MIXART1
            ,AM01.ARTNUM 
            ,AM01.ARTSHONAM 
            ,AM01.ARTGRP02
            ,AM01.ARTGRP03
            ,AM01.ARTGRP04
            ,AM01.ARTGRP05
            ,AM01.ARTGRP09
            ,AM01.NUMSUU
            ,'Cumple'
            ,CASE 
                WHEN
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTSHONAM LIKE ('%' + CONVERT(VARCHAR, NUMSUU))
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_04] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_05] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                    )
            THEN 'Cumple'
            WHEN
                AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 = '0'
                    AND (NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_04] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_05] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                    ))
            THEN 'NoCumple'
            ELSE 'NoAplica'
            END AS DR2035_1
            ,CASE
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTSHONAM LIKE 'M%'
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTSHONAM NOT LIKE 'M%'
                    AND NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                THEN 'NoCumple'
                ELSE 'NoAplica'
            END AS DR2035_2

FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC AS AM01;

--UPDATE PRODUCTO TERMINADO NO CUMPLE 
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC]
SET DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple'
WHERE DataRules_DR2035_1 = 'NoCumple'
OR DataRules_DR2035_2 = 'NoCumple';

-- UPDATE PRODUCTO TERMINADO NO APLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC]
SET DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoAplica'
WHERE DataRules_DR2035_1 = 'NoAplica'
AND DataRules_DR2035_2 = 'NoAplica';

/* DR2035 TONI */
INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2035_TON_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[ARTLNKNUM3_1_2]
           ,[SPRCOD]
           ,[MIXART1]
           ,[ARTNUM]
           ,[ARTSHONAM]
           ,[ARTGRP02]
           ,[ARTGRP03]
           ,[ARTGRP04]
           ,[ARTGRP05]
           ,[ARTGRP09]
           ,[NUMSUU]
           ,[DataRules_DR2035_Descripcion_Corta_Producto_Terminado]
           ,[DataRules_DR2035_1]
           ,[DataRules_DR2035_2])
            SELECT USER 
            ,USER 
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM) 
            ,AM01.EFTDAT 
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.ARTLNKNUM3_1_2 
            ,AM01.SPRCOD
            ,AM01.MIXART1
            ,AM01.ARTNUM 
            ,AM01.ARTSHONAM 
            ,AM01.ARTGRP02
            ,AM01.ARTGRP03
            ,AM01.ARTGRP04
            ,AM01.ARTGRP05
            ,AM01.ARTGRP09
            ,AM01.NUMSUU
            ,'Cumple'
            ,CASE 
                WHEN
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTSHONAM LIKE ('%' + CONVERT(VARCHAR, NUMSUU))
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_04] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                    )
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_05] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                    )
            THEN 'Cumple'
            WHEN
                AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 = '0'
                    OR (NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_04] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP04, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP04 = AM01.ARTGRP04
                    )
                    OR NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_05] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP05, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP05 = AM01.ARTGRP05
                    ))
            THEN 'NoCumple'
            ELSE 'NoAplica'
            END AS DR2035_1
            ,CASE
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTSHONAM LIKE 'M%'
                    AND EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999' 
                    AND AM01.ARTTYP = '1' 
                    AND AM01.ARTCLSCOD = '7' 
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.ARTLNKNUM3_1_2 = 'AF'
                    AND AM01.MIXART1 <> '0'
                    AND AM01.ARTSHONAM NOT LIKE 'M%'
                    AND NOT EXISTS (
                        SELECT 1
                        FROM [dbo].[EBX_EC_BASIS__SD2035_02] AS SD
                        CROSS APPLY STRING_SPLIT(SD.ABREV_ARTGRP02, ';') AS split_values
                        WHERE AM01.ARTSHONAM LIKE '%' + split_values.value + '%' AND SD.ARTGRP02 = AM01.ARTGRP02
                    )
                THEN 'NoCumple'
                ELSE 'NoAplica'
            END AS DR2035_2

FROM EBX_EC_BASIS_ARTICULOS__AM01_TON_EC AS AM01;

--UPDATE PRODUCTO TERMINADO NO CUMPLE 
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC]
SET DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple'
WHERE DataRules_DR2035_1 = 'NoCumple'
OR DataRules_DR2035_2 = 'NoCumple';

-- UPDATE PRODUCTO TERMINADO NO APLICA
UPDATE [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC]
SET DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoAplica'
WHERE DataRules_DR2035_1 = 'NoAplica'
AND DataRules_DR2035_2 = 'NoAplica';

TRUNCATE TABLE [dbo].[EBX_EC_STG__AM01_3011_BEB_EC];
TRUNCATE TABLE [dbo].[EBX_EC_STG__AM25_3011_BEB_EC];

INSERT INTO [dbo].[EBX_EC_STG__AM01_3011_BEB_EC]
      ([ARTNAM],
      [EFTDAT],
      [SPRCOD],
      [ARTNUM],
      [MIXART1],
      [MIXART2],
      [MIXART3],
      [MIXART4],
      [MIXART5],
      [MIXART6],
      [MIXSUU1],
      [MIXSUU2],
      [MIXSUU3],
      [MIXSUU4],
      [MIXSUU5],
      [MIXSUU6],
      [ARTGRP01],
      [ARTGRP04],
      [ARTGRP05],
      [ARTGRP07],
      [ARTGRP09],
      [NUMSUU])
      SELECT ARTNAM, EFTDAT, SPRCOD, ARTNUM,  MIXART1, MIXART2, MIXART3, MIXART4, MIXART5, MIXART6, MIXSUU1, MIXSUU2, MIXSUU3, MIXSUU4, MIXSUU5, MIXSUU6, ARTGRP01, ARTGRP04, ARTGRP05, ARTGRP07, ARTGRP09, NUMSUU
      FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC 
      WHERE SPRCOD <> 'S' AND EFTDAT = '1999999' 
      GROUP BY ARTNAM, EFTDAT, SPRCOD, ARTNUM,  MIXART1, MIXART2, MIXART3, MIXART4, MIXART5, MIXART6, MIXSUU1, MIXSUU2, MIXSUU3, MIXSUU4, MIXSUU5, MIXSUU6, ARTGRP01, ARTGRP04, ARTGRP05, ARTGRP07, ARTGRP09, NUMSUU;

    INSERT INTO [dbo].[EBX_EC_STG__AM25_3011_BEB_EC](
            [ARTNUM],
            [EFTDAT],
            [PRI],
            [PRILST]
            )
        SELECT ARTNUM, EFTDAT, PRI, PRILST
        FROM EBX_EC_BASIS_PRECIOS_ARTICULOS__AM25_BEB_EC
        WHERE EFTDAT = '1999999'
        GROUP BY ARTNUM, EFTDAT, PRI, PRILST; 

   /* 3011 TONI STG TABLES */
    TRUNCATE TABLE [dbo].[EBX_EC_STG__AM01_3011_TON_EC];
    TRUNCATE TABLE [dbo].[EBX_EC_STG__AM25_3011_TON_EC];

    INSERT INTO [dbo].[EBX_EC_STG__AM01_3011_TON_EC]
      ([ARTNAM],
      [EFTDAT],
      [SPRCOD],
      [ARTNUM],
      [MIXART1],
      [MIXART2],
      [MIXART3],
      [MIXART4],
      [MIXART5],
      [MIXART6],
      [MIXSUU1],
      [MIXSUU2],
      [MIXSUU3],
      [MIXSUU4],
      [MIXSUU5],
      [MIXSUU6],
      [ARTGRP01],
      [ARTGRP04],
      [ARTGRP05],
      [ARTGRP07],
      [ARTGRP09],
      [ARTGRP03],
      [NUMSUU])
      SELECT ARTNAM, EFTDAT, SPRCOD, ARTNUM,  MIXART1, MIXART2, MIXART3, MIXART4, MIXART5, MIXART6, MIXSUU1, MIXSUU2, MIXSUU3, MIXSUU4, MIXSUU5, MIXSUU6, ARTGRP01, ARTGRP04, ARTGRP05, ARTGRP07, ARTGRP09, ARTGRP03, NUMSUU
      FROM EBX_EC_BASIS_ARTICULOS__AM01_TON_EC 
      WHERE SPRCOD <> 'S' AND EFTDAT = '1999999' 
      GROUP BY ARTNAM, EFTDAT, SPRCOD, ARTNUM,  MIXART1, MIXART2, MIXART3, MIXART4, MIXART5, MIXART6, MIXSUU1, MIXSUU2, MIXSUU3, MIXSUU4, MIXSUU5, MIXSUU6, ARTGRP01, ARTGRP04, ARTGRP05, ARTGRP07, ARTGRP09, ARTGRP03, NUMSUU;


    INSERT INTO [dbo].[EBX_EC_STG__AM25_3011_TON_EC](
            [ARTNUM],
            [EFTDAT],
            [PRI],
            [PRILST]
            )
        SELECT ARTNUM, EFTDAT, PRI, PRILST
        FROM EBX_EC_BASIS_PRECIOS_ARTICULOS__AM25_TON_EC
        WHERE EFTDAT = '1999999'
        GROUP BY ARTNUM, EFTDAT, PRI, PRILST;


    INSERT INTO [dbo].[EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__]
          ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR3011_TON_EC_ID]
           ,[AM25_EFTDAT]
           ,[AM25_EFTDATD]
           ,[AM01_ARTNUM]
           ,[AM01_ARTNAM]
           ,[AM01_MIXART1]
           ,[AM01_MIXART2]
           ,[AM01_MIXART3]
           ,[AM01_MIXART4]
           ,[AM01_MIXART5]
           ,[AM01_MIXART6]
           ,[AM01_MIXSUU1]
           ,[AM01_MIXSUU2]
           ,[AM01_MIXSUU3]
           ,[AM01_MIXSUU4]
           ,[AM01_MIXSUU5]
           ,[AM01_MIXSUU6]
           ,[AM01_ARTGRP01]
           ,[AM01_ARTGRP04]
           ,[AM01_ARTGRP05]
           ,[AM01_ARTGRP07]
           ,[AM01_ARTGRP09]
           ,[AM01_NUMSUU]
           ,[AM25_PRI]
           ,[AM25_PRILST]
           ,[AM01_SPRCOD]
           ,[AM01_ARTGRP03]
           ,[DataRules_DR3011_Palanca_Comercial_Combo])
            SELECT USER
            ,USER
            ,GETDATE()
            ,0
            ,row_number() over (order by AM01.ARTNUM)
            ,AM25.EFTDAT
            ,IIF(AM25.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM25.EFTDAT, 6), 12))
            ,AM01.ARTNUM
            ,AM01.ARTNAM
            ,AM01.MIXART1
            ,AM01.MIXART2
            ,AM01.MIXART3
            ,AM01.MIXART4
            ,AM01.MIXART5
            ,AM01.MIXART6
            ,AM01.MIXSUU1
            ,AM01.MIXSUU2
            ,AM01.MIXSUU3
            ,AM01.MIXSUU4
            ,AM01.MIXSUU5
            ,AM01.MIXSUU6
            ,AM01.ARTGRP01
            ,AM01.ARTGRP04
            ,AM01.ARTGRP05
            ,AM01.ARTGRP07
            ,AM01.ARTGRP09
            ,AM01.NUMSUU
            ,AM25.PRI
            ,AM25.PRILST
            ,AM01.SPRCOD
            ,AM01.ARTGRP03
            ,CASE
                WHEN 
                    AM01.MIXART1 <> '0'
                    AND EXISTS
                    (SELECT 1 
                    FROM EBX_EC_BASIS__SD3011_PalancaComercial_TON AS SD
                    WHERE AM01.ARTGRP01 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP01, ';'))
                    AND AM01.ARTGRP03 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP03, ';'))
                    AND AM01.ARTGRP04 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP04, ';'))
                    AND AM01.ARTGRP05 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP05, ';'))
                    AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP07, ';'))
                    AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP09, ';'))
                    AND CAST(AM25.PRILST AS NVARCHAR) IN (SELECT value FROM STRING_SPLIT(SD.AM25_PRILST, ';')))    
                    AND ROUND((-(AM25.PRI/100000.00*100.00)/
                    (((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART1 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART1 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU1) 
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART2 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART2 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU2) 
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART3 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART3 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU3)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART4 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART4 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU4)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART5 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART5 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU5)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART6 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART6 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU6))
                    + 100.00),3) >= (SELECT TOP 1 MIN01 FROM EBX_EC_BASIS__SD3011_PalancaComercial_TON AS SD
                                    WHERE CAST(AM25.PRILST AS NVARCHAR) IN (SELECT value FROM STRING_SPLIT(SD.AM25_PRILST, ';'))
                                    AND AM01.ARTGRP01 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP01, ';'))
                                    AND AM01.ARTGRP03 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP03, ';'))
                                    AND AM01.ARTGRP04 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP04, ';'))
                                    AND AM01.ARTGRP05 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP05, ';'))
                                    AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP07, ';'))
                                    AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP09, ';'))) 
                    AND ROUND((-(AM25.PRI/100000.00*100.00)/
                    (((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART1 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART1 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU1)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART2 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART2 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU2) 
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART3 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART3 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU3)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART4 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART4 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU4)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART5 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART5 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU5)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART6 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART6 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU6))
                    + 100.00),3) <= (SELECT TOP 1 MAX01 FROM EBX_EC_BASIS__SD3011_PalancaComercial_TON AS SD
                                    WHERE CAST(AM25.PRILST AS NVARCHAR) IN (SELECT value FROM STRING_SPLIT(SD.AM25_PRILST, ';'))
                                    AND AM01.ARTGRP01 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP01, ';'))
                                    AND AM01.ARTGRP03 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP03, ';'))
                                    AND AM01.ARTGRP04 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP04, ';'))
                                    AND AM01.ARTGRP05 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP05, ';'))
                                    AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP07, ';'))
                                    AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP09, ';')))
                THEN 'Cumple'
                WHEN 
                    AM01.MIXART1<> '0' 
                    AND EXISTS
                    (SELECT 1 
                    FROM EBX_EC_BASIS__SD3011_PalancaComercial_TON AS SD
                    WHERE AM01.ARTGRP01 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP01, ';'))
                    AND AM01.ARTGRP03 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP03, ';'))
                    AND AM01.ARTGRP04 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP04, ';'))
                    AND AM01.ARTGRP05 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP05, ';'))
                    AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP07, ';'))
                    AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP09, ';'))
                    AND CAST(AM25.PRILST AS NVARCHAR) IN (SELECT value FROM STRING_SPLIT(SD.AM25_PRILST, ';')))      
                    AND (ROUND((-(AM25.PRI/100000.00*100.00)/
                    (((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART1 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART1 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU1)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART2 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART2 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU2) 
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART3 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART3 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU3)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART4 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART4 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU4)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART5 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART5 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU5)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART6 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART6 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU6))
                    + 100.00),3) <= (SELECT TOP 1 MIN01 FROM EBX_EC_BASIS__SD3011_PalancaComercial_TON AS SD
                                    WHERE CAST(AM25.PRILST AS NVARCHAR) IN (SELECT value FROM STRING_SPLIT(SD.AM25_PRILST, ';'))
                                    AND AM01.ARTGRP01 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP01, ';'))
                                    AND AM01.ARTGRP03 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP03, ';'))
                                    AND AM01.ARTGRP04 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP04, ';'))
                                    AND AM01.ARTGRP05 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP05, ';'))
                                    AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP07, ';'))
                                    AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP09, ';'))) 
                    OR ROUND((-(AM25.PRI/100000.00*100.00)/
                    (((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART1 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART1 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU1)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART2 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART2 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU2) 
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART3 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART3 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU3)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART4 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART4 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU4)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART5 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART5 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU5)
                    +
                    ((ISNULL(NULLIF((SELECT TOP 1 ART.PRI FROM  EBX_EC_STG__AM01_3011_TON_EC  AS AM1
                        FULL OUTER JOIN EBX_EC_STG__AM25_3011_TON_EC AS ART ON ART.ARTNUM = AM1.ARTNUM
                        WHERE AM1.ARTNUM = AM01.MIXART6 AND AM25.PRILST = ART.PRILST  AND AM1.EFTDAT = '1999999' AND ART.EFTDAT = '1999999' AND AM1.SPRCOD <> 'S'), 0), 1)/100000.00)/ISNULL(NULLIF((SELECT TOP 1 ART.NUMSUU FROM EBX_EC_STG__AM01_3011_TON_EC AS ART
                    WHERE ART.ARTNUM = AM01.MIXART6 AND ART.EFTDAT = '1999999' AND ART.SPRCOD <> 'S'),0), 1)* AM01.MIXSUU6))
                    + 100.00),3) >= (SELECT TOP 1 MAX01 FROM EBX_EC_BASIS__SD3011_PalancaComercial_TON AS SD
                                    WHERE CAST(AM25.PRILST AS NVARCHAR) IN (SELECT value FROM STRING_SPLIT(SD.AM25_PRILST, ';'))
                                    AND AM01.ARTGRP01 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP01, ';'))
                                    AND AM01.ARTGRP03 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP03, ';'))
                                    AND AM01.ARTGRP04 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP04, ';'))
                                    AND AM01.ARTGRP05 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP05, ';'))
                                    AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP07, ';'))
                                    AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP09, ';'))))
                THEN 'NoCumple'
                WHEN 
                    NOT EXISTS
                    (SELECT 1 
                    FROM EBX_EC_BASIS__SD3011_PalancaComercial_TON AS SD
                    WHERE AM01.ARTGRP01 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP01, ';'))
                    AND AM01.ARTGRP03 IN  (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP03, ';'))
                    AND AM01.ARTGRP04 IN  (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP04, ';'))
                    AND AM01.ARTGRP05 IN  (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP05, ';'))
                    AND AM01.ARTGRP07 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP07, ';'))
                    AND AM01.ARTGRP09 IN (SELECT value FROM STRING_SPLIT(SD.AM01_ARTGRP09, ';')))
                    OR AM25.PRILST NOT IN ('101','110','113','114','116','120','121','123','124','125','202','203','204','205','206','207','208','209','210','213','215','217','224','226','429','431','432','439','800','801','102','103','104','105','106','107','108','109','111','112','115','201','211','212','214','218','219','220','221','223','425','426','427','428','435','443','444')
                THEN 'NoAplica'  
            END AS DR3011
    FROM EBX_EC_STG__AM01_3011_TON_EC AS AM01
    LEFT JOIN EBX_EC_STG__AM25_3011_TON_EC AS AM25 ON AM01.ARTNUM = AM25.ARTNUM
    WHERE AM25.PRILST IN ('101','110','113','114','116','120','121','123','124','125','202','203','204','205','206','207','208','209','210','213','215','217','224','226','429','431','432','439','800','801','102','103','104','105','106','107','108','109','111','112','115','201','211','212','214','218','219','220','221','223','425','426','427','428','435','443','444')
	AND AM01.MIXART1  <> '0'
    AND (AM01.NUMSUU IS NOT NULL OR AM01.NUMSUU <> '0')
    AND (AM25.PRI IS NOT NULL OR AM25.PRI <> '0')
    AND AM25.EFTDAT = '1999999'
    AND AM01.EFTDAT = '1999999'
    AND (AM01.SPRCOD <> 'S');

UPDATE [dbo].[EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__]
        SET DataRules_DR3011_Palanca_Comercial_Combo = 'NoAplica'
        WHERE DataRules_DR3011_Palanca_Comercial_Combo IS NULL;
        
    /* 2016 BEBIDAS */
    INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2016_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP05]
           ,[ARTGRP01]
           ,[ARTGRP06]
           ,[ARTNUM]
           ,[MIXART1]
           ,[DataRules_DR2016_Tipo_Empaque_Producto_Terminado])
            SELECT USER
            ,USER
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM)
            ,AM01.EFTDAT
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12))
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.SPRCOD
            ,AM01.ARTGRP05
            ,AM01.ARTGRP01
            ,AM01.ARTGRP06
            ,AM01.ARTNUM
            ,AM01.MIXART1
            ,CASE 
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP05 IS NULL OR AM01.ARTGRP05 = '')
                    AND (AM01.ARTGRP06 IS NULL OR AM01.ARTGRP06 = '')
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP05 = '99')
                    AND (AM01.ARTGRP01 = 'BR' OR AM01.ARTGRP01 = 'BV' OR AM01.ARTGRP01 = 'BJ')
                THEN 'Cumple'
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 = '99'
                    AND AM01.ARTGRP01 NOT IN ('BR','BV','BJ')
                THEN 'NoCumple'
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 <> '99'
                    AND AM01.ARTGRP01 IN ('BR','BV','BJ')
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 IN ('AC', 'BI', '98')
                    AND (AM01.ARTGRP06 = '10')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 IN ('AC','BI')
                    AND (AM01.ARTGRP06 <> '10')
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP06 = '20'
                    AND AM01.ARTGRP05 IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 = '98'
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                THEN 'Cumple'
                ELSE 'NoAplica'
            END AS DR2016
    FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC] AS AM01;

    /* 2016 TONI */
    INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2016_TON_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP05]
           ,[ARTGRP01]
           ,[ARTGRP06]
           ,[ARTNUM]
           ,[MIXART1]
           ,[DataRules_DR2016_Tipo_Empaque_Producto_Terminado])
            SELECT USER
            ,USER
            ,GETDATE()
            ,0 
            ,row_number() OVER (order by AM01.ARTNUM)
            ,AM01.EFTDAT
            ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12))
            ,AM01.ARTTYP
            ,AM01.ARTCLSCOD
            ,AM01.SPRCOD
            ,AM01.ARTGRP05
            ,AM01.ARTGRP01
            ,AM01.ARTGRP06
            ,AM01.ARTNUM
            ,AM01.MIXART1
            ,CASE 
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP05 IS NULL OR AM01.ARTGRP05 = '')
                    AND (AM01.ARTGRP06 IS NULL OR AM01.ARTGRP06 = '')
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND (AM01.ARTGRP05 = '99')
                    AND (AM01.ARTGRP01 = 'BR' OR AM01.ARTGRP01 = 'BV' OR AM01.ARTGRP01 = 'BJ')
                THEN 'Cumple'
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 = '99'
                    AND AM01.ARTGRP01 NOT IN ('BR','BV','BJ')
                THEN 'NoCumple'
                WHEN
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 <> '99'
                    AND AM01.ARTGRP01 IN ('BR','BV','BJ')
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 IN ('AC', 'BI', '98')
                    AND (AM01.ARTGRP06 = '10')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 IN ('AC','BI')
                    AND (AM01.ARTGRP06 <> '10')
                THEN 'NoCumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP06 = '20'
                    AND AM01.ARTGRP05 IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 = '0'
                    AND AM01.ARTGRP05 = '98'
                THEN 'Cumple'
                WHEN 
                    AM01.EFTDAT = '1999999'
                    AND AM01.ARTTYP = '1'
                    AND AM01.ARTCLSCOD = '7'
                    AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                    AND AM01.MIXART1 <> '0'
                THEN 'Cumple'
                ELSE 'NoAplica'
            END AS DR2016
    FROM [dbo].[EBX_EC_BASIS_ARTICULOS__AM01_TON_EC] AS AM01;

    /* 2017 BEBIDAS */
    INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2017_BEB_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP06]
           ,[ARTGRP05]
           ,[ARTNUM]
           ,[MIXART1]
           ,[DataRules_DR2017_Envase_Retornable_Producto_Terminado])
            SELECT USER 
                ,USER 
                ,GETDATE()
                ,0 
                ,row_number() OVER (order by AM01.ARTNUM) 
                ,AM01.EFTDAT 
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.SPRCOD
                ,AM01.ARTGRP06
                ,AM01.ARTGRP05
                ,AM01.ARTNUM
                ,AM01.MIXART1
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND (AM01.ARTGRP06 IS NULL OR TRIM(AM01.ARTGRP06) = '')
                        AND AM01.MIXART1 = '0'
                        AND (AM01.ARTGRP05 IS NULL OR TRIM(AM01.ARTGRP05) = '')
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP06 = '90'
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 IN ('AC', 'BI')
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 NOT IN ('AC', 'BI')
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTGRP06 = '20'
                        AND AM01.ARTGRP05 IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '80'
                        AND AM01.ARTGRP05 = '98'
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '80'
                        AND AM01.ARTGRP05 <> '98'
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 IN ('AC', 'BI', '98')
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 NOT IN ('AC', 'BI', '98')
                    THEN 'NoCumple'
                    WHEN
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '20'
                        AND AM01.ARTGRP05 IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                    THEN 'Cumple'
                    WHEN
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '20'
                        AND AM01.ARTGRP05 NOT IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                    THEN 'NoCumple'
                    ELSE 'NoAplica'
                    END AS DR2017
    FROM EBX_EC_BASIS_ARTICULOS__AM01_BEB_EC AS AM01;



    /* 2017 TONI */
    INSERT INTO [dbo].[EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC]
           ([T_LAST_USER_ID]
           ,[T_CREATOR_ID]
           ,[T_CREATION_DATE]
           ,[T_LAST_WRITE]
           ,[DR2017_TON_EC_ID]
           ,[EFTDAT]
           ,[EFTDATD]
           ,[ARTTYP]
           ,[ARTCLSCOD]
           ,[SPRCOD]
           ,[ARTGRP06]
           ,[ARTGRP05]
           ,[ARTNUM]
           ,[MIXART1]
           ,[DataRules_DR2017_Envase_Retornable_Producto_Terminado])
            SELECT USER 
                ,USER 
                ,GETDATE()
                ,0 
                ,row_number() OVER (order by AM01.ARTNUM) 
                ,AM01.EFTDAT 
                ,IIF(AM01.EFTDAT='1999999', CONVERT(DATE, '31/12/9999', 103), TRY_CONVERT(DATE, RIGHT(AM01.EFTDAT, 6), 12)) 
                ,AM01.ARTTYP
                ,AM01.ARTCLSCOD
                ,AM01.SPRCOD
                ,AM01.ARTGRP06
                ,AM01.ARTGRP05
                ,AM01.ARTNUM
                ,AM01.MIXART1
                ,CASE  
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND (AM01.ARTGRP06 IS NULL OR TRIM(AM01.ARTGRP06) = '')
                        AND AM01.MIXART1 = '0'
                        AND (AM01.ARTGRP05 IS NULL OR TRIM(AM01.ARTGRP05) = '')
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.ARTGRP06 = '90'
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 IN ('AC', 'BI')
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 NOT IN ('AC', 'BI')
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 = '0'
                        AND AM01.ARTGRP06 = '20'
                        AND AM01.ARTGRP05 IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '80'
                        AND AM01.ARTGRP05 = '98'
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '80'
                        AND AM01.ARTGRP05 <> '98'
                    THEN 'NoCumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 IN ('AC', 'BI', '98')
                    THEN 'Cumple'
                    WHEN 
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '10'
                        AND AM01.ARTGRP05 NOT IN ('AC', 'BI', '98')
                    THEN 'NoCumple'
                    WHEN
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '20'
                        AND AM01.ARTGRP05 IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                    THEN 'Cumple'
                    WHEN
                        AM01.EFTDAT = '1999999' 
                        AND AM01.ARTTYP = '1' 
                        AND AM01.ARTCLSCOD = '7' 
                        AND (AM01.SPRCOD IS NULL OR TRIM(AM01.SPRCOD) = '')
                        AND AM01.MIXART1 <> '0'
                        AND AM01.ARTGRP06 = '20'
                        AND AM01.ARTGRP05 NOT IN ('AR', 'BU', 'BT', 'BN', 'BI', 'AC', 'BP', 'BV', 'BE', 'BQ', 'BH', 'AF', 'BR', '98', 'AV', 'AO', 'AM', 'AL', 'AE', 'AK', 'BF', 'AB', '99', 'BC', 'AY', 'AI')
                    THEN 'NoCumple'
                    ELSE 'NoAplica'
                    END AS DR2017
    FROM EBX_EC_BASIS_ARTICULOS__AM01_TON_EC AS AM01;

    /*UPDATE KPIS*/
    UPDATE [dbo].[EBX_DATARULES_VALUES_DataRulesPercents]
    SET [DR1002_BEB_EC] =    
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC 
                                WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple'
                            )
        ,[DR1004_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC 
                                WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple'
                            )
        ,[DR1006_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC 
                                WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple'
                            )
        ,[DR1007_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC 
                                WHERE DataRules_DR1007_Correo_electronico = 'Cumple'
                            )
        ,[DR1009_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC 
                                WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple'
                            )
        ,[DR1011_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC 
                                WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple'
                            )
        ,[DR1012_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC 
                                WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple'
                            )
        ,[DR1024_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC 
                                WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple'
                            )
        ,[DR1035_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC 
                                WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple'
                            )
        ,[DR1036_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC 
                                WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple'
                            )
        ,[DR1082_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC 
                                WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple'
                            )
        ,[DR1083_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC 
                                WHERE DataRules_DR1083_AC_Digital = 'Cumple'
                            )
        ,[DR1084_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC 
                                WHERE DataRules_DR1084_Lista_Precios = 'Cumple'
                            )
        ,[DR1086_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC 
                                WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple'
                            )
        ,[DR1002_TON_EC] =    
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC 
                                WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple'
                            )
        ,[DR1004_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC 
                                WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple'
                            )
        ,[DR1006_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC 
                                WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple'
                            )
        ,[DR1007_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC 
                                WHERE DataRules_DR1007_Correo_electronico = 'Cumple'
                            )
        ,[DR1009_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC 
                                WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple'
                            )
        ,[DR1011_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC 
                                WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple'
                            )
        ,[DR1012_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC 
                                WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple'
                            )
        ,[DR1024_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC 
                                WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple'
                            )
        ,[DR1035_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC 
                                WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple'
                            )
        ,[DR1036_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC 
                                WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple'
                            )
        ,[DR1082_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC 
                                WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple'
                            )
        ,[DR1083_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC 
                                WHERE DataRules_DR1083_AC_Digital = 'Cumple'
                            )
        ,[DR1084_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC 
                                WHERE DataRules_DR1084_Lista_Precios = 'Cumple'
                            )
        ,[DR1086_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC 
                                WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple'
                            )
        ,[DR2046_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC 
                                WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple'
                            )
        ,[DR2061_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC 
                                WHERE DataRules_DR2061_Unidad_Peso = 'Cumple'
                            )
        ,[DR3003_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC WHERE DataRules_DR3003_Fecha_Vigenci = 'Cumple' OR DataRules_DR3003_Fecha_Vigenci = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC WHERE DataRules_DR3003_Fecha_Vigenci = 'Cumple' OR DataRules_DR3003_Fecha_Vigenci = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC 
                                WHERE DataRules_DR3003_Fecha_Vigenci = 'Cumple'
                            )
        ,[DR3010_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC WHERE DataRules_DR3010_Ajustes = 'Cumple' OR DataRules_DR3010_Ajustes = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC WHERE DataRules_DR3010_Ajustes = 'Cumple' OR DataRules_DR3010_Ajustes = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC 
                                WHERE DataRules_DR3010_Ajustes = 'Cumple'
                            )
        ,[DR3011_BEB_EC] = 
                            ( 
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__  WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__  
                                WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' 
                            )
        ,[DR3012_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC 
                                WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple'
                            )
        ,[DR2004_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC 
                                WHERE DataRules_DR2004_Codigo_Barras = 'Cumple'
                            )
        ,[DR2004_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC 
                                WHERE DataRules_DR2004_Codigo_Barras = 'Cumple'
                            )
        ,[DR2046_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC 
                                WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple'
                            )
        ,[DR2061_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC 
                                WHERE DataRules_DR2061_Unidad_Peso = 'Cumple'
                            )
        ,[DR3003_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC WHERE DataRules_DR3003_Fecha_Vigencia = 'Cumple' OR DataRules_DR3003_Fecha_Vigencia = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC WHERE DataRules_DR3003_Fecha_Vigencia = 'Cumple' OR DataRules_DR3003_Fecha_Vigencia = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC 
                                WHERE DataRules_DR3003_Fecha_Vigencia = 'Cumple'
                            )
        ,[DR3011_TON_EC] = 
                            ( 
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__  WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM  EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__  
                               WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple'
                            )
        ,[DR3012_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC 
                                WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple'
                            )
        ,[DR2002_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC 
                                WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple'
                            )
        ,[DR2002_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC 
                                WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple'
                            )
        ,[DR2009_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC 
                                WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple'
                            )
        ,[DR2009_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC 
                                WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple'
                            )
        ,[DR2010_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC 
                                WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'Cumple'
                            )
        ,[DR2010_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC 
                                WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'Cumple'
                            )
        ,[DR2001_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC 
                                WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'Cumple'
                            )
        ,[DR2001_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC 
                                WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'Cumple'
                            )
        ,[DR2011_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC 
                                WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'Cumple'
                            )
        ,[DR2011_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC
                                WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'Cumple'
                            )
        ,[DR2015_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'Cumple' OR DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'Cumple' OR DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ 
                                WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'Cumple'
                            )
        ,[DR2016_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC 
                                WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple'
                            )
        ,[DR2016_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC 
                                WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple'
                            )
        ,[DR2017_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC 
                                WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple'
                            )
        ,[DR2017_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC 
                                WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple'
                            )
        ,[DR2021_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC 
                                WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple'
                            ) 
        ,[DR2021_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC 
                                WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple'
                            )
        ,[DR2035_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC 
                                WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple'
                            )
        ,[DR2035_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC 
                                WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple'
                            )       
        ,[DR2045_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC 
                                WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'Cumple'
                            )

    WHERE Cumplimiento = 'Cumple';

    UPDATE [dbo].[EBX_DATARULES_VALUES_DataRulesPercents]
    SET [DR1002_BEB_EC] =    
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC 
                                WHERE DataRules_DR1002_Nombre_del_Cliente = 'NoCumple'
                            )
        ,[DR1004_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC 
                                WHERE DataRules_DR1004_Direccion_del_Cliente = 'NoCumple'
                            )
        ,[DR1006_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC 
                                WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple'
                            )
        ,[DR1007_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC 
                                WHERE DataRules_DR1007_Correo_electronico = 'NoCumple'
                            )
        ,[DR1009_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC 
                                WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple'
                            )
        ,[DR1011_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC 
                                WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple'
                            )
        ,[DR1012_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC 
                                WHERE DataRules_DR1012_Cuenta_Clave = 'NoCumple'
                            )
        ,[DR1024_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC 
                                WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple'
                            )
        ,[DR1035_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC 
                                WHERE DataRules_DR1035_Peticion_Borrado = 'NoCumple'
                            )
        ,[DR1036_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC 
                                WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple'
                            )
        ,[DR1082_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC 
                                WHERE DataRules_DR1082_Catalogo_Productos = 'NoCumple'
                            )
        ,[DR1083_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC 
                                WHERE DataRules_DR1083_AC_Digital = 'NoCumple'
                            )
        ,[DR1084_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC 
                                WHERE DataRules_DR1084_Lista_Precios = 'NoCumple'
                            )
        ,[DR1086_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC 
                                WHERE DataRules_DR1086_Agencia_de_Ventas = 'NoCumple'
                            )
        ,[DR1002_TON_EC] =    
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple' OR DataRules_DR1002_Nombre_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC 
                                WHERE DataRules_DR1002_Nombre_del_Cliente = 'NoCumple'
                            )
        ,[DR1004_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple' OR DataRules_DR1004_Direccion_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC 
                                WHERE DataRules_DR1004_Direccion_del_Cliente = 'NoCumple'
                            )
        ,[DR1006_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple' OR DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC 
                                WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple'
                            )
        ,[DR1007_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple' OR DataRules_DR1007_Correo_electronico = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC 
                                WHERE DataRules_DR1007_Correo_electronico = 'NoCumple'
                            )
        ,[DR1009_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple' OR DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC 
                                WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple'
                            )
        ,[DR1011_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple' OR DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC 
                                WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple'
                            )
        ,[DR1012_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple' OR DataRules_DR1012_Cuenta_Clave = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC 
                                WHERE DataRules_DR1012_Cuenta_Clave = 'NoCumple'
                            )
        ,[DR1024_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple' OR DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC 
                                WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple'
                            )
        ,[DR1035_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple' OR DataRules_DR1035_Peticion_Borrado = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC 
                                WHERE DataRules_DR1035_Peticion_Borrado = 'NoCumple'
                            )
        ,[DR1036_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple' OR DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC 
                                WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple'
                            )
        ,[DR1082_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple' OR DataRules_DR1082_Catalogo_Productos = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC 
                                WHERE DataRules_DR1082_Catalogo_Productos = 'NoCumple'
                            )
        ,[DR1083_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple' OR DataRules_DR1083_AC_Digital = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC 
                                WHERE DataRules_DR1083_AC_Digital = 'NoCumple'
                            )
        ,[DR1084_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple' OR DataRules_DR1084_Lista_Precios = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC 
                                WHERE DataRules_DR1084_Lista_Precios = 'NoCumple'
                            )
        ,[DR1086_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple' OR DataRules_DR1086_Agencia_de_Ventas = 'NoCumple')))
                                FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC 
                                WHERE DataRules_DR1086_Agencia_de_Ventas = 'NoCumple'
                            )
        ,[DR2004_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC 
                                WHERE DataRules_DR2004_Codigo_Barras = 'NoCumple'
                            )
        ,[DR2004_TON_EC] = 
                    (
                        SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                            (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple' OR DataRules_DR2004_Codigo_Barras = 'NoCumple')))
                        FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC 
                        WHERE DataRules_DR2004_Codigo_Barras = 'NoCumple'
                    )
        ,[DR2046_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC 
                                WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2061_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC 
                                WHERE DataRules_DR2061_Unidad_Peso = 'NoCumple'
                            )
        ,[DR3003_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC WHERE DataRules_DR3003_Fecha_Vigenci = 'Cumple' OR DataRules_DR3003_Fecha_Vigenci = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC WHERE DataRules_DR3003_Fecha_Vigenci = 'Cumple' OR DataRules_DR3003_Fecha_Vigenci = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC 
                                WHERE DataRules_DR3003_Fecha_Vigenci = 'NoCumple'
                            )
        ,[DR3010_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC WHERE DataRules_DR3010_Ajustes = 'Cumple' OR DataRules_DR3010_Ajustes = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC WHERE DataRules_DR3010_Ajustes = 'Cumple' OR DataRules_DR3010_Ajustes = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC 
                                WHERE DataRules_DR3010_Ajustes = 'NoCumple'
                            )
        ,[DR3011_BEB_EC] = 
                            ( 
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__  WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__  
                                WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple'
                            )
        ,[DR3012_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC 
                                WHERE DataRules_DR3012_Doble_Beneficio = 'NoCumple'
                            )
        ,[DR2046_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple' OR DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC 
                                WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2061_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple' OR DataRules_DR2061_Unidad_Peso = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC 
                                WHERE DataRules_DR2061_Unidad_Peso = 'NoCumple'
                            )
        ,[DR3003_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC WHERE DataRules_DR3003_Fecha_Vigencia = 'Cumple' OR DataRules_DR3003_Fecha_Vigencia = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC WHERE DataRules_DR3003_Fecha_Vigencia = 'Cumple' OR DataRules_DR3003_Fecha_Vigencia = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC 
                                WHERE DataRules_DR3003_Fecha_Vigencia = 'NoCumple'
                            )
        ,[DR3011_TON_EC] = 
                            ( 
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__  WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM  EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple' OR DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__  
                                WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple'
                            )
        ,[DR3012_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple' OR DataRules_DR3012_Doble_Beneficio = 'NoCumple')))
                                FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC 
                                WHERE DataRules_DR3012_Doble_Beneficio = 'NoCumple'
                            )
		,[DR2002_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC 
                                WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2002_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC 
                                WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2009_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC 
                                WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2009_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC 
                                WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2010_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC 
                                WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'NoCumple'
                            )
        ,[DR2010_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'Cumple' OR DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC 
                                WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'NoCumple'
                            )
        ,[DR2001_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC 
                                WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2001_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'Cumple' OR DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC 
                                WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoCumple'
                            )
        ,[DR2011_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC 
                                WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoCumple'
                            )
        ,[DR2011_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'Cumple' OR DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC 
                                WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoCumple'
                            )
        ,[DR2015_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'Cumple' OR DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'Cumple' OR DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ 
                                WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2016_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC 
                                WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple'
                            ) 
        ,[DR2016_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple' OR DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC
                                WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple'
                            ) 
        ,[DR2017_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC 
                                WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2017_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple' OR DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC 
                                WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2021_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC 
                                WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple'
                            ) 
        ,[DR2021_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple' OR DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC 
                                WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2035_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC 
                                WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple'
                            )
        ,[DR2035_TON_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple' OR DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC 
                                WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple'
                            )       
        ,[DR2045_BEB_EC] = 
                            (
                                SELECT CONVERT(DECIMAL(7,2), COUNT(*) * 100.00/ IIF(
                                    (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'NoCumple')=0, 1, (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'Cumple' OR DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'NoCumple')))
                                FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC 
                                WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'NoCumple'
                            )
    WHERE Cumplimiento = 'NoCumple';

    /* Update Concentrado BEB */
    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_BEB_EC WHERE DataRules_DR1002_Nombre_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1002_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_BEB_EC WHERE DataRules_DR1004_Direccion_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1004_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1006_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_BEB_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1006_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC WHERE DataRules_DR1007_Correo_electronico = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_BEB_EC WHERE DataRules_DR1007_Correo_electronico LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1007_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_BEB_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1009_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_BEB_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1011_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC WHERE DataRules_DR1012_Cuenta_Clave = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_BEB_EC WHERE DataRules_DR1012_Cuenta_Clave LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1012_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_BEB_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1024_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC WHERE DataRules_DR1035_Peticion_Borrado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_BEB_EC WHERE DataRules_DR1035_Peticion_Borrado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1035_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_BEB_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1036_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC WHERE DataRules_DR1082_Catalogo_Productos = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_BEB_EC WHERE DataRules_DR1082_Catalogo_Productos LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1082_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC WHERE DataRules_DR1083_AC_Digital = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_BEB_EC WHERE DataRules_DR1083_AC_Digital LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1083_BEB';


    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC WHERE DataRules_DR1084_Lista_Precios = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_BEB_EC WHERE DataRules_DR1084_Lista_Precios LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1084_BEB';

    UPDATE EBX_DATARULES_VALUES_DataRulesFiltered
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_BEB_EC WHERE DataRules_DR1086_Agencia_de_Ventas LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1086_BEB';

    SELECT ID, ROW_NUMBER() OVER (ORDER BY CUMPLE DESC) AS "ORDER" INTO #TBO FROM EBX_DATARULES_VALUES_DataRulesFiltered;
    UPDATE TA SET TA.C_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_DataRulesFiltered AS TA INNER JOIN #TBO AS TB ON TA.ID = TB.ID;

    SELECT ID, ROW_NUMBER() OVER (ORDER BY NO_CUMPLE DESC) AS "ORDER" INTO #TBN FROM EBX_DATARULES_VALUES_DataRulesFiltered;
    UPDATE TA SET TA.NC_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_DataRulesFiltered AS TA INNER JOIN #TBN AS TB ON TA.ID = TB.ID;

    /* Update Concentrado TON */
    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC WHERE DataRules_DR1002_Nombre_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1002_TON_EC WHERE DataRules_DR1002_Nombre_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1002_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC WHERE DataRules_DR1004_Direccion_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1004_TON_EC WHERE DataRules_DR1004_Direccion_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1004_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1006_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1006_TON_EC WHERE DataRules_DR1006_Numeros_de_Telefono_del_Cliente LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1006_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC WHERE DataRules_DR1007_Correo_electronico = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC WHERE DataRules_DR1007_Correo_electronico = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1007_TON_EC WHERE DataRules_DR1007_Correo_electronico LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1007_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1009_TON_EC WHERE DataRules_GR_DR1009_DR1009_Condicion_de_Pago LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1009_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1011_TON_EC WHERE DataRules_GR_DR1011_DR1011_RUC_CI LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1011_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC WHERE DataRules_DR1012_Cuenta_Clave = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC WHERE DataRules_DR1012_Cuenta_Clave = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1012_TON_EC WHERE DataRules_DR1012_Cuenta_Clave LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1012_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1024_TON_EC WHERE DataRules_DR1024_Actividad_Canal_Subcanal LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1024_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC WHERE DataRules_DR1035_Peticion_Borrado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC WHERE DataRules_DR1035_Peticion_Borrado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1035_TON_EC WHERE DataRules_DR1035_Peticion_Borrado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1035_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1036_TON_EC WHERE DataRules_DR1036_Datos_de_Geolocalizacion LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1036_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC WHERE DataRules_DR1082_Catalogo_Productos = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC WHERE DataRules_DR1082_Catalogo_Productos = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1082_TON_EC WHERE DataRules_DR1082_Catalogo_Productos LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1082_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC WHERE DataRules_DR1083_AC_Digital = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC WHERE DataRules_DR1083_AC_Digital = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1083_TON_EC WHERE DataRules_DR1083_AC_Digital LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1083_TON';


    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC WHERE DataRules_DR1084_Lista_Precios = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC WHERE DataRules_DR1084_Lista_Precios = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1084_TON_EC WHERE DataRules_DR1084_Lista_Precios LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1084_TON';

    UPDATE EBX_DATARULES_VALUES_DataRulesFilteredToni
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC WHERE DataRules_DR1086_Agencia_de_Ventas = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_CLIENTES_DATARULES__DR1086_TON_EC WHERE DataRules_DR1086_Agencia_de_Ventas LIKE '%Cumple')
        WHERE DATA_RULE = 'DR1086_TON';

    SELECT ID, ROW_NUMBER() OVER (ORDER BY CUMPLE DESC) AS "ORDER" INTO #TBOT FROM EBX_DATARULES_VALUES_DataRulesFilteredToni;
    UPDATE TA SET TA.C_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_DataRulesFilteredToni AS TA INNER JOIN #TBOT AS TB ON TA.ID = TB.ID;

    SELECT ID, ROW_NUMBER() OVER (ORDER BY NO_CUMPLE DESC) AS "ORDER" INTO #TBNT FROM EBX_DATARULES_VALUES_DataRulesFilteredToni;
    UPDATE TA SET TA.NC_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_DataRulesFilteredToni AS TA INNER JOIN #TBNT AS TB ON TA.ID = TB.ID;


    /* Update Cumplimiento BEB */
  UPDATE [dbo].[EBX_DATARULES_VALUES_DataRulesCompliance]
    SET [CLIENT_COMPLIANCE] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFiltered)
        ,[N_DATA_RULES] = (SELECT COUNT(*) FROM EBX_DATARULES_VALUES_DataRulesFiltered)
        ,[DISTRIBUTION_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFiltered
                                    WHERE DIMENSION LIKE '%Distri%')
        ,[FRACTURATION_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFiltered
                                    WHERE DIMENSION LIKE '%Factu%')
        ,[TAX_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFiltered
                                    WHERE DIMENSION LIKE '%Fisca%')
        ,[GENERAL_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFiltered
                                    WHERE DIMENSION LIKE '%Gener%')
        ,[SELLS_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFiltered
                                    WHERE DIMENSION LIKE '%Venta%')
        ,[VALIDITY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_DataRulesFiltered WHERE DATA_RULE IN ('DR1002_BEB', 'DR1004_BEB', 'DR1006_BEB', 'DR1007_BEB', 'DR1009_BEB', 'DR1011_BEB', 'DR1012_BEB', 'DR1024_BEB', 'DR1035_BEB', 'DR1036_BEB', 
        'DR1082_BEB', 'DR1083_BEB', 'DR1084_BEB', 'DR1086_BEB'))
        )
        ,[ACCURACY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_DataRulesFiltered WHERE DATA_RULE IN ('DR1002_BEB', 'DR1004_BEB', 'DR1006_BEB', 'DR1007_BEB', 'DR1009_BEB', 'DR1011_BEB', 'DR1012_BEB', 'DR1024_BEB', 'DR1035_BEB', 'DR1036_BEB', 
        'DR1082_BEB', 'DR1083_BEB', 'DR1084_BEB', 'DR1086_BEB'))
        )
        ,[DUPLICITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_DataRulesFiltered WHERE DATA_RULE IN ('DR1002_BEB', 'DR1004_BEB', 'DR1006_BEB', 'DR1007_BEB', 'DR1036_BEB'))
        )
        ,[COMPLETENESS] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_DataRulesFiltered WHERE DATA_RULE IN ('DR1002_BEB', 'DR1004_BEB', 'DR1006_BEB', 'DR1009_BEB',  'DR1011_BEB', 'DR1012_BEB',
            'DR1024_BEB', 'DR1036_BEB', 'DR1082_BEB', 'DR1084_BEB', 'DR1086_BEB'))
        )
        ,[AVAILABILITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_DataRulesFiltered WHERE DATA_RULE IN ('DR1004_BEB', 'DR1006_BEB', 'DR1007_BEB', 'DR1011_BEB', 'DR1024_BEB',
            'DR1036_BEB'))
        )
        
    WHERE ID = 1;

    /* Update Cumplimiento TON */
    UPDATE [dbo].[EBX_DATARULES_VALUES_DataRulesComplianceToni]
    SET [CLIENT_COMPLIANCE] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFilteredToni)
        ,[N_DATA_RULES] = (SELECT COUNT(*) FROM EBX_DATARULES_VALUES_DataRulesFilteredToni)
        ,[DISTRIBUTION_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFilteredToni
                                    WHERE DIMENSION LIKE '%Distri%')
        ,[FRACTURATION_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFilteredToni
                                    WHERE DIMENSION LIKE '%Factu%')
        ,[TAX_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFilteredToni
                                    WHERE DIMENSION LIKE '%Fisca%')
        ,[GENERAL_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFilteredToni
                                    WHERE DIMENSION LIKE '%Gener%')
        ,[SELLS_DATA] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_DataRulesFilteredToni
                                    WHERE DIMENSION LIKE '%Venta%')
        ,[VALIDITY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM  EBX_DATARULES_VALUES_DataRulesFilteredToni WHERE DATA_RULE IN ('DR1002_TON', 'DR1004_TON', 'DR1006_TON', 'DR1007_TON', 'DR1009_TON', 'DR1011_TON', 'DR1012_TON', 'DR1024_TON', 'DR1035_TON', 'DR1036_TON', 
        'DR1082_TON', 'DR1083_TON', 'DR1084_TON', 'DR1086_TON'))
        )
        ,[ACCURACY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM  EBX_DATARULES_VALUES_DataRulesFilteredToni WHERE DATA_RULE IN ('DR1002_TON', 'DR1004_TON', 'DR1006_TON', 'DR1007_TON', 'DR1009_TON', 'DR1011_TON', 'DR1012_TON', 'DR1024_TON', 'DR1035_TON', 'DR1036_TON', 
        'DR1082_TON', 'DR1083_TON', 'DR1084_TON', 'DR1086_TON'))
        )
        ,[DUPLICITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM  EBX_DATARULES_VALUES_DataRulesFilteredToni WHERE DATA_RULE IN ('DR1002_TON', 'DR1004_TON', 'DR1006_TON', 'DR1007_TON', 'DR1036_TON'))
        )
        ,[COMPLETENESS] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM  EBX_DATARULES_VALUES_DataRulesFilteredToni WHERE DATA_RULE IN ('DR1002_TON', 'DR1004_TON', 'DR1006_TON', 'DR1009_TON',  'DR1011_TON', 'DR1012_TON',
            'DR1024_TON', 'DR1036_TON', 'DR1082_TON', 'DR1084_TON', 'DR1086_TON'))
        )
        ,[AVAILABILITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM  EBX_DATARULES_VALUES_DataRulesFilteredToni WHERE DATA_RULE IN ('DR1004_TON', 'DR1006_TON', 'DR1007_TON', 'DR1011_TON', 'DR1024_TON',
            'DR1036_TON'))
        )
    WHERE ID = 1;

    /* Update Concentrado BEB PREC E PROMO (Filtered) */
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC WHERE DataRules_DR3003_Fecha_Vigenci = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC WHERE DataRules_DR3003_Fecha_Vigenci = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_BEB_EC WHERE DataRules_DR3003_Fecha_Vigenci LIKE '%Cumple')
        WHERE DATA_RULE = 'DR3003_BEB';

    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC WHERE DataRules_DR3010_Ajustes = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC WHERE DataRules_DR3010_Ajustes = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3010_BEB_EC WHERE DataRules_DR3010_Ajustes LIKE '%Cumple')
        WHERE DATA_RULE = 'DR3010_BEB';

    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_BEB_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo LIKE '%Cumple')
        WHERE DATA_RULE = 'DR3011_BEB';

    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC WHERE DataRules_DR3012_Doble_Beneficio = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_BEB_EC WHERE DataRules_DR3012_Doble_Beneficio LIKE '%Cumple')
        WHERE DATA_RULE = 'DR3012_BEB';

    SELECT ID, ROW_NUMBER() OVER (ORDER BY CUMPLE DESC) AS "ORDER" INTO #TBOX 
    FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB;
    UPDATE TA SET TA.C_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB AS TA INNER JOIN #TBOX AS TB ON TA.ID = TB.ID;

    SELECT ID, ROW_NUMBER() OVER (ORDER BY NO_CUMPLE DESC) AS "ORDER" INTO #TBOK 
    FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB;
    UPDATE TA SET TA.NC_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB AS TA INNER JOIN #TBOK AS TB ON TA.ID = TB.ID;
  
    /* Update Concentrado TON PREC E PROMO (Filtered) */
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_PP_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC WHERE DataRules_DR3003_Fecha_Vigencia = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC WHERE DataRules_DR3003_Fecha_Vigencia = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3003_TON_EC WHERE DataRules_DR3003_Fecha_Vigencia LIKE '%Cumple')
        WHERE DATA_RULE = 'DR3003_TON';

    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_PP_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3011_TON_EC__ WHERE DataRules_DR3011_Palanca_Comercial_Combo LIKE '%Cumple')
        WHERE DATA_RULE = 'DR3011_TON';

    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_PP_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC WHERE DataRules_DR3012_Doble_Beneficio = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC WHERE DataRules_DR3012_Doble_Beneficio = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_PRECPROMO_DATARULES__DR3012_TON_EC WHERE DataRules_DR3012_Doble_Beneficio LIKE '%Cumple')
        WHERE DATA_RULE = 'DR3012_TON';


    SELECT ID, ROW_NUMBER() OVER (ORDER BY CUMPLE DESC) AS "ORDER" INTO #TBOX_T FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON;
    UPDATE TA SET TA.C_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON AS TA INNER JOIN #TBOX_T AS TB ON TA.ID = TB.ID;

    SELECT ID, ROW_NUMBER() OVER (ORDER BY NO_CUMPLE DESC) AS "ORDER" INTO #TBOK_T FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON;
    UPDATE TA SET TA.NC_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON AS TA INNER JOIN #TBOK_T AS TB ON TA.ID = TB.ID;

    /* Update Cumplimiento BEB PREC E PROMO*/
    UPDATE [dbo].[EBX_DATARULES_VALUES_Cumplimiento_DR_PP_BEB]
    SET [CLIENT_COMPLIANCE] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB)

        ,[N_DATA_RULES] = (SELECT COUNT(*) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB)
        ,[DATOS_COMERCIALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB
                                    WHERE DIMENSION LIKE '%Comerc%')
        ,[DATOS_PRECIOS] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB
                                    WHERE DIMENSION LIKE '%Prec%')
        ,[DATOS_PROMOCIONES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB
                                    WHERE DIMENSION LIKE '%Promoc%')
        ,[VALIDITY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB WHERE DATA_RULE IN ('DR3003_BEB', 'DR3010_BEB', 'DR3011_BEB', 'DR3012_BEB'))
        )
        ,[ACCURACY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB WHERE DATA_RULE IN ('DR3003_BEB', 'DR3010_BEB', 'DR3011_BEB','DR3012_BEB'))
        )
        ,[DUPLICITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB WHERE DATA_RULE IN ('DR3010_BEB', 'DR3011_BEB'))
        )
        ,[COMPLETENESS] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB WHERE DATA_RULE IN ('DR3003_BEB', 'DR3012_BEB', 'DR3011_BEB'))
        )
        ,[AVAILABILITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_BEB WHERE DATA_RULE IN ('DR3003_BEB', 'DR3011_BEB','DR3012_BEB'))
        )
        
    WHERE ID = 1;

    /* Update Cumplimiento TON PREC E PROMO */
    UPDATE [dbo].[EBX_DATARULES_VALUES_Cumplimiento_DR_PP_TON]
    SET [CLIENT_COMPLIANCE] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON)

        ,[N_DATA_RULES] = (SELECT COUNT(*) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON)
        ,[DATOS_COMERCIALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON
                                    WHERE DIMENSION LIKE '%Comerc%')
        ,[DATOS_PROMOCIONES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON
                                    WHERE DIMENSION LIKE '%Promoc%')
        ,[VALIDITY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON WHERE DATA_RULE IN ('DR3003_TON', 'DR3012_TON', 'DR3011_TON'))
        )
        ,[ACCURACY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON WHERE DATA_RULE IN ('DR3003_TON', 'DR3012_TON', 'DR3011_TON'))
        )
        ,[DUPLICITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON WHERE DATA_RULE IN ('DR3011_TON'))
        )
        ,[COMPLETENESS] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON WHERE DATA_RULE IN ('DR3003_TON', 'DR3012_TON'))
        )
        ,[AVAILABILITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_PP_TON WHERE DATA_RULE IN ('DR3003_TON', 'DR3012_TON'))
        )
        
    WHERE ID = 1;

    /* Update Concentrado BEB MATERIALES (Filtered) */
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_BEB_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2001_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_BEB_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2002_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC WHERE DataRules_DR2004_Codigo_Barras = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_BEB_EC WHERE DataRules_DR2004_Codigo_Barras LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2004_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_BEB_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2009_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_BEB_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Bebidas LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2010_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_BEB_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Beb LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2011_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2015_BEB_EC_ WHERE DataRules_DR2015_Indicador_Calorias_Bebidas_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2015_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_BEB_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2016_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_BEB_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2017_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_BEB_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2021_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_BEB_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2035_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2045_BEB_EC WHERE DataRules_GR_DR2045_DR2045_Impuestos_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2045_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_BEB_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2046_BEB';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC WHERE DataRules_DR2061_Unidad_Peso = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_BEB_EC WHERE DataRules_DR2061_Unidad_Peso LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2061_BEB';

    SELECT ID, ROW_NUMBER() OVER (ORDER BY CUMPLE DESC) AS "ORDER" INTO #TBK FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB;
    UPDATE TA SET TA.C_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB AS TA INNER JOIN #TBK AS TB ON TA.ID = TB.ID;

    SELECT ID, ROW_NUMBER() OVER (ORDER BY NO_CUMPLE DESC) AS "ORDER" INTO #TBY FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB;
    UPDATE TA SET TA.NC_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB AS TA INNER JOIN #TBY AS TB ON TA.ID = TB.ID;

    /* Update Concentrado TON MATERIALES (Filtered) */
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2001_TON_EC WHERE DataRules_GR_DR2001_DR2001_Descripcion_Material_Producto_Terminado_Toni LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2001_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2002_TON_EC WHERE DataRules_GR_DR2002_DR2002_Unidad_de_Medida_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2002_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC WHERE DataRules_DR2004_Codigo_Barras = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC WHERE DataRules_DR2004_Codigo_Barras = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2004_TON_EC WHERE DataRules_DR2004_Codigo_Barras LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2004_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2009_TON_EC WHERE DataRules_GR_DR2009_DR2009_Agrupador_de_Marca_Y_Extensiones_de_Linea_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2009_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2010_TON_EC WHERE DataRules_DR2010_Categoria_y_Subcategoria_Producto_Terminado_Toni LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2010_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2011_TON_EC WHERE DataRules_DR2011_Sabor_Producto_Terminado_Ton LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2011_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2016_TON_EC WHERE DataRules_DR2016_Tipo_Empaque_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2016_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2017_TON_EC WHERE DataRules_DR2017_Envase_Retornable_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2017_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2021_TON_EC WHERE DataRules_DR2021_Medida_Empaque_Contenido_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2021_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2035_TON_EC WHERE DataRules_DR2035_Descripcion_Corta_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2035_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2046_TON_EC WHERE DataRules_DR2046_Bloqueo_Producto_Terminado LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2046_TON';
    UPDATE EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
        SET
            CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC WHERE DataRules_DR2061_Unidad_Peso = 'Cumple'),
            NO_CUMPLE = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC WHERE DataRules_DR2061_Unidad_Peso = 'NoCumple'),
            TOTAL = (SELECT COUNT(*) FROM EBX_EC_BASIS_ARTICULOS_DATARULES__DR2061_TON_EC WHERE DataRules_DR2061_Unidad_Peso LIKE '%Cumple')
        WHERE DATA_RULE = 'DR2061_TON';

    SELECT ID, ROW_NUMBER() OVER (ORDER BY CUMPLE DESC) AS "ORDER" INTO #TBA FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON;
    UPDATE TA SET TA.C_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON AS TA INNER JOIN #TBA AS TB ON TA.ID = TB.ID;

    SELECT ID, ROW_NUMBER() OVER (ORDER BY NO_CUMPLE DESC) AS "ORDER" INTO #TBB FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON;
    UPDATE TA SET TA.NC_ORDER = TB."ORDER" FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON AS TA INNER JOIN #TBB AS TB ON TA.ID = TB.ID;

    /* Update Cumplimiento BEB MATERIALES */
    UPDATE [dbo].[EBX_DATARULES_VALUES_Cumplimiento_DR_MAT_BEB]
    SET [CUMPLIMIENTO_MATERIALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB)
        ,[N_DATA_RULES] = (SELECT COUNT(*) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB)
        ,[DATOS_GENERALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
                                 WHERE DIMENSION LIKE '%Gener%')
        ,[DATOS_DIMENSIONES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
                                   WHERE DIMENSION LIKE '%Dimens%')
        ,[DATOS_MARCAS_RGM] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
                                   WHERE DIMENSION LIKE '%Marca%')                        
        ,[DATOS_FISCALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
                                   WHERE DIMENSION LIKE '%Fiscal%')  
        ,[DATOS_BLOQUEO] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB
                                   WHERE DIMENSION LIKE '%Bloque%')                           
        ,[VALIDITY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB WHERE DATA_RULE IN ('DR2001_BEB','DR2002_BEB','DR2004_BEB','DR2009_BEB','DR2010_BEB','DR2011_BEB','DR2015_BEB','DR2016_BEB','DR2017_BEB','DR2021_BEB','DR2035_BEB','DR2045_BEB','DR2046_BEB','DR2061_BEB'))
        )
        ,[ACCURACY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB WHERE DATA_RULE IN ('DR2001_BEB','DR2002_BEB','DR2004_BEB','DR2009_BEB','DR2010_BEB','DR2011_BEB','DR2015_BEB','DR2016_BEB','DR2017_BEB','DR2021_BEB','DR2035_BEB','DR2045_BEB','DR2061_BEB'))
        )
        ,[DUPLICITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB WHERE DATA_RULE IN ('DR2001_BEB','DR2035_BEB'))
        )
        ,[COMPLETENESS] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB WHERE DATA_RULE IN ('DR2001_BEB','DR2002_BEB','DR2004_BEB','DR2009_BEB','DR2010_BEB','DR2011_BEB','DR2015_BEB','DR2016_BEB','DR2017_BEB','DR2021_BEB','DR2035_BEB','DR2045_BEB','DR2061_BEB'))
        )
        ,[AVAILABILITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_BEB WHERE DATA_RULE IN ('DR2001_BEB','DR2002_BEB','DR2004_BEB','DR2009_BEB','DR2010_BEB','DR2011_BEB','DR2015_BEB','DR2016_BEB','DR2017_BEB','DR2021_BEB','DR2035_BEB','DR2045_BEB','DR2046_BEB','DR2061_BEB'))
        )
        
    WHERE ID = 1;

    /* Update Cumplimiento TON MATERIALES */
    UPDATE [dbo].[EBX_DATARULES_VALUES_Cumplimiento_DR_MAT_TON]
    SET [CUMPLIMIENTO_MATERIALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON)
        ,[N_DATA_RULES] = (SELECT COUNT(*) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON)
        ,[DATOS_GENERALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
                                WHERE DIMENSION LIKE '%Gener%')
        ,[DATOS_DIMENSIONES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
                                   WHERE DIMENSION LIKE '%Dimens%')
        ,[DATOS_MARCAS_RGM] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
                                   WHERE DIMENSION LIKE '%Marca%')                        
        ,[DATOS_FISCALES] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
                                   WHERE DIMENSION LIKE '%Fiscal%')  
        ,[DATOS_BLOQUEO] = (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE)) * 100.00 /SUM(TOTAL)) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON
                                   WHERE DIMENSION LIKE '%Bloque%')                           
        ,[VALIDITY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON WHERE DATA_RULE IN ('DR2001_TON','DR2002_TON','DR2004_TON','DR2009_TON','DR2010_TON','DR2011_TON','DR2016_TON','DR2017_TON','DR2021_TON','DR2035_TON','DR2046_TON','DR2061_TON'))
        )
        ,[ACCURACY] = 
        (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON WHERE DATA_RULE IN ('DR2001_TON','DR2002_TON','DR2004_TON','DR2009_TON','DR2010_TON','DR2011_TON','DR2016_TON','DR2017_TON','DR2021_TON','DR2035_TON','DR2061_TON'))
        )
        ,[DUPLICITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON WHERE DATA_RULE IN ('DR2001_TON','DR2035_TON'))
        )
        ,[COMPLETENESS] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON WHERE DATA_RULE IN ('DR2001_TON','DR2002_TON','DR2004_TON','DR2009_TON','DR2010_TON','DR2011_TON','DR2016_TON','DR2017_TON','DR2021_TON','DR2035_TON','DR2061_TON'))
        )
        ,[AVAILABILITY] = (
            (SELECT CONVERT(DECIMAL(7,2), CONVERT(DECIMAL(10,2), SUM(CUMPLE) * 100.00 / SUM(TOTAL))) FROM EBX_DATARULES_VALUES_Concentrado_DR_MAT_TON WHERE DATA_RULE IN ('DR2001_TON','DR2002_TON','DR2004_TON','DR2009_TON','DR2010_TON','DR2011_TON','DR2016_TON','DR2017_TON','DR2021_TON','DR2035_TON','DR2046_TON','DR2061_TON'))
        )
        
    WHERE ID = 1;


