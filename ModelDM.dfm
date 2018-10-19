object BoldModelDM: TBoldModelDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 407
  Width = 522
  object bsh: TBoldSystemHandle
    IsDefault = True
    SystemTypeInfoHandle = bstih
    Active = False
    PersistenceHandle = bph
    Left = 120
    Top = 104
  end
  object bstih: TBoldSystemTypeInfoHandle
    BoldModel = BoldModel1
    Left = 120
    Top = 56
  end
  object BaseDBActionList: TActionList
    Left = 32
    Top = 8
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DataSource = HasAllBonusDS
    end
    object BoldUpdateDBAction1: TBoldUpdateDBAction
      Category = 'Bold Actions'
      Caption = 'Update DB'
      Enabled = False
      ImageIndex = 4
      BoldSystemHandle = bsh
    end
    object BoldActivateSystemAction1: TBoldActivateSystemAction
      Category = 'Bold Actions'
      Caption = 'Open system'
      BoldSystemHandle = bsh
      OnSystemOpened = BoldActivateSystemAction1SystemOpened
      OnSystemClosed = BoldActivateSystemAction1SystemClosed
      OpenCaption = 'Open system'
      CloseCaption = #1054#1090#1082#1083#1102#1095#1080#1090#1100#1089#1103
      SaveQuestion = #1042#1099#1081#1090#1080' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1089' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077#1084' '#1080#1079#1084#1077#1085#1077#1085#1080#1081'?'
      SaveOnClose = saAsk
    end
    object DriversPrmDSP: TDataSetPost
      Category = 'Dataset'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      DataSource = HasAllBonusDS
    end
    object DataSetPost2: TDataSetPost
      Category = 'Dataset'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DataSource = HasAllBonusDS
    end
  end
  object RBoldTranslit: TRBoldTranslit
    Active = True
    Left = 120
    Top = 8
  end
  object bph: TBoldPersistenceHandleDB
    BoldModel = BoldModel1
    ClockLogGranularity = '0:0:0.0'
    DatabaseAdapter = bdaADO
    Left = 120
    Top = 152
  end
  object bdaADO: TBoldDatabaseAdapterADO
    SQLDatabaseConfig.ColumnTypeForDate = 'DATETIME'
    SQLDatabaseConfig.ColumnTypeForTime = 'DATETIME'
    SQLDatabaseConfig.ColumnTypeForDateTime = 'DATETIME'
    SQLDatabaseConfig.ColumnTypeForBlob = 'IMAGE'
    SQLDatabaseConfig.ColumnTypeForFloat = 'DECIMAL (28,10)'
    SQLDatabaseConfig.ColumnTypeForCurrency = 'MONEY'
    SQLDatabaseConfig.ColumnTypeForString = 'VARCHAR(%d)'
    SQLDatabaseConfig.ColumnTypeForInteger = 'INTEGER'
    SQLDatabaseConfig.ColumnTypeForSmallInt = 'SMALLINT'
    SQLDatabaseConfig.DropColumnTemplate = 'ALTER TABLE <TableName> DROP COLUMN <ColumnName>'
    SQLDatabaseConfig.DropTableTemplate = 'DROP TABLE <TableName>'
    SQLDatabaseConfig.DropIndexTemplate = 'DROP INDEX <TableName>.<IndexName>'
    SQLDatabaseConfig.SQLforNotNull = 'NOT NULL'
    SQLDatabaseConfig.QuoteNonStringDefaultValues = False
    SQLDatabaseConfig.SupportsConstraintsInCreateTable = True
    SQLDatabaseConfig.SupportsStringDefaultValues = True
    SQLDatabaseConfig.DBGenerationMode = dbgQuery
    SQLDatabaseConfig.ReservedWords.Strings = (
      'ACTIVE, ADD, ALL, AFTER, ALTER'
      'AND, ANY, AS, ASC, ASCENDING,'
      'AT, AUTO, AUTOINC, AVG, BASE_NAME'
      'BEFORE, BEGIN, BETWEEN, BLOB, BOOLEAN,'
      'BOTH, BY, BYTES, CACHE, CAST, CHAR'
      'CHARACTER, CHECK, CHECK_POINT_LENGTH, COLLATE,'
      'COLUMN, COMMIT, COMMITTED, COMPUTED'
      'CONDITIONAL, CONSTRAINT, CONTAINING, COUNT, CREATE, CSTRING,'
      'CURRENT, CURSOR, DATABASE, DATE, DAY'
      'DEBUG, DEC, DECIMAL, DECLARE, DEFAULT,'
      'DELETE, DESC, DESCENDING, DISTINCT, DO'
      'DOMAIN, DOUBLE, DROP, ELSE, END,'
      'ENTRY_POINT, ESCAPE, EXCEPTION, EXECUTE'
      'EXISTS, EXIT, EXTERNAL, EXTRACT, FILE, FILTER,'
      'FLOAT, FOR, FOREIGN, FROM, FULL, FUNCTION'
      'GDSCODE, GENERATOR, GEN_ID, GRANT,'
      'GROUP, GROUP_COMMIT_WAIT_TIME, HAVING'
      'HOUR, IF, IN, INT, INACTIVE, INDEX, INNER,'
      'INPUT_TYPE, INSERT, INTEGER, INTO'
      'IS, ISOLATION, JOIN, KEY, LONG, LENGTH,'
      'LOGFILE, LOWER, LEADING, LEFT, LEVEL'
      'LIKE, LOG_BUFFER_SIZE, MANUAL, MAX, MAXIMUM_SEGMENT,'
      'MERGE, MESSAGE, MIN, MINUTE, MODULE_NAME'
      'MONEY, MONTH, NAMES, NATIONAL, NATURAL,'
      'NCHAR, NO, NOT, NULL, NUM_LOG_BUFFERS'
      'NUMERIC, OF, ON, ONLY, OPTION,'
      'OR, ORDER, OUTER, OUTPUT_TYPE, OVERFLOW'
      'PAGE_SIZE, PAGE, PAGES, PARAMETER, PASSWORD,'
      'PLAN, POSITION, POST_EVENT, PRECISION'
      
        'PROCEDURE, PROTECTED, PRIMARY, PRIVILEGES, RAW_PARTITIONS, RDB$D' +
        'B_KEY,'
      'READ, REAL, RECORD_VERSION, REFERENCES'
      'RESERV, RESERVING, RETAIN, RETURNING_VALUES, RETURNS, REVOKE,'
      'RIGHT, ROLE, ROLLBACK, SECOND, SEGMENT'
      'SELECT, SET, SHARED, SHADOW, SCHEMA, SINGULAR,'
      'SIZE, SMALLINT, SNAPSHOT, SOME, SORT'
      'SQLCODE, STABILITY, STARTING, STARTS, STATISTICS,'
      'SUB_TYPE, SUBSTRING, SUM, SUSPEND, TABLE'
      'THEN, TIME, TIMESTAMP, TIMEZONE_HOUR, TIMEZONE_MINUTE,'
      'TO, TRAILING, TRANSACTION, TRIGGER, TRIM'
      'UNCOMMITTED, UNION, UNIQUE, UPDATE, UPPER,'
      'USER, VALUE, VALUES, VARCHAR, VARIABLE'
      'VARYING, VIEW, WAIT, WHEN, WHERE,'
      'WHILE, WITH, WORK, WRITE, YEAR')
    SQLDatabaseConfig.StoreEmptyStringsAsNULL = False
    SQLDatabaseConfig.SystemTablePrefix = 'BOLD'
    SQLDatabaseConfig.SqlScriptSeparator = '---'
    SQLDatabaseConfig.SqlScriptTerminator = ';'
    SQLDatabaseConfig.SqlScriptCommentStart = '/* '
    SQLDatabaseConfig.SqlScriptCommentStop = ' */'
    SQLDatabaseConfig.SqlScriptStartTransaction = 'BEGIN TRAN'
    SQLDatabaseConfig.SqlScriptCommitTransaction = 'COMMIT TRAN'
    SQLDatabaseConfig.SqlScriptRollBackTransaction = 'ROLLBACK TRAN'
    Connection = ADOConnection
    DatabaseEngine = dbeSQLServer
    Left = 32
    Top = 104
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 320
    Top = 56
  end
  object USRLoginADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 440
    Top = 104
  end
  object CurrTNumADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'c_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select telefon_klienta as pvalue from zakaz where nomer_zakaza=:' +
        'c_num')
    Left = 216
    Top = 56
  end
  object CurrAdressADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'c_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select adres_vyzova_vvodim as pvalue from zakaz where nomer_zaka' +
        'za=:c_num')
    Left = 440
    Top = 56
  end
  object CurrArhValADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'c_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select Arhivnyi as pvalue from zakaz where nomer_zakaza=:c_num')
    Left = 440
    Top = 8
  end
  object BoldModel1: TBoldModel
    UMLModelMode = ummNone
    Boldify.EnforceDefaultUMLCase = False
    Boldify.DefaultNavigableMultiplicity = '0..1'
    Boldify.DefaultNonNavigableMultiplicity = '0..*'
    Left = 32
    Top = 56
    Model = (
      'VERSION 19'
      '(Model'
      #9'"BusinessClasses"'
      #9'"BusinessClassesRoot"'
      #9'""'
      #9'""'
      
        #9'"_BoldInternal.toolId=43B9040C00F9,_BoldInternal.flattened=True' +
        ',_Boldify.boldified=True,_BoldInternal.ModelErrors=,Bold.DelphiN' +
        'ame=<Name>,Bold.RootClass=BusinessClassesRoot"'
      #9'(Classes'
      #9#9'(Class'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'"<NONE>"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_Boldify.autoCreated=True,Bold.TableN' +
        'ame=<Prefix>_OBJECT"'
      #9#9#9'(Attributes'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43B9077103E6,persistence=persistent,Bol' +
        'd.DelphiName=TSpravochnik,Bold.ExpressionName=Spravochnik,Bold.T' +
        'ableName=Spravochnik,Bold.InterfaceName=ISpravochnik"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43B9078F003D,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Naimenovanie,Bold.ExpressionName=Na' +
        'imenovanie,Bold.DelphiName=Naimenovanie"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA322400E9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kommentarii,Bold.ExpressionName=Kom' +
        'mentarii,Bold.DelphiName=Kommentarii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA40720260,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Identifikator,Bold.ExpressionName=I' +
        'dentifikator,Bold.DelphiName=Identifikator"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1075#1088#1091#1087#1087' '#1074#1099#1087#1091#1089#1082#1086#1074'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43B907B303C7,persistence=persistent,Bol' +
        'd.DelphiName=TSpravochnik_grupp_vypuskov,Bold.ExpressionName=Spr' +
        'avochnik_grupp_vypuskov,Bold.TableName=Spravochnik_grupp_vypusko' +
        'v,Bold.InterfaceName=ISpravochnik_grupp_vypuskov"'
      #9#9#9'(Attributes'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1055#1077#1088#1089#1086#1085#1072'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43B907C7033B,persistence=persistent,Bol' +
        'd.DelphiName=TPersona,Bold.ExpressionName=Persona,Bold.TableName' +
        '=Persona,Bold.InterfaceName=IPersona"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1060#1072#1084#1080#1083#1080#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3B4203B7,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Familiya,Bold.ExpressionName=Famili' +
        'ya,Bold.DelphiName=Familiya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1084#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3B4E02EC,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Imya,Bold.ExpressionName=Imya,Bold.' +
        'DelphiName=Imya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1090#1095#1077#1089#1090#1074#1086'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3B5302CD,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Otchestvo,Bold.ExpressionName=Otche' +
        'stvo,Bold.DelphiName=Otchestvo"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1059#1083#1080#1094#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3B920221,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Ulica,Bold.ExpressionName=Ulica,Bol' +
        'd.DelphiName=Ulica"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1086#1084'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3B98004C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Dom,Bold.ExpressionName=Dom,Bold.De' +
        'lphiName=Dom"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1074#1072#1088#1090#1080#1088#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3B9C0108,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kvartira,Bold.ExpressionName=Kvarti' +
        'ra,Bold.DelphiName=Kvartira"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1088#1087#1091#1089'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3BA1004C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Korpus,Bold.ExpressionName=Korpus,B' +
        'old.DelphiName=Korpus"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3BBB0202,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Mobiljnyi_telefon,Bold.ExpressionNa' +
        'me=Mobiljnyi_telefon,Bold.DelphiName=Mobiljnyi_telefon"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1073#1086#1095#1080#1081' '#1090#1077#1083#1077#1092#1086#1085'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3BDD034A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Rabochii_telefon,Bold.ExpressionNam' +
        'e=Rabochii_telefon,Bold.DelphiName=Rabochii_telefon"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1086#1084#1072#1096#1085#1080#1081' '#1090#1077#1083#1077#1092#1086#1085'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3BFA0195,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Domashnii_telefon,Bold.ExpressionNa' +
        'me=Domashnii_telefon,Bold.DelphiName=Domashnii_telefon"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA3C11008B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Elektronnyi_adres,Bold.ExpressionNa' +
        'me=Elektronnyi_adres,Bold.DelphiName=Elektronnyi_adres"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1086#1083#1085#1086#1077' '#1080#1084#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD5B2603E7,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Polnoe_imya,Bold.ExpressionName=Polno' +
        'e_imya,Bold.DelphiName=Polnoe_imya,\"Bold.DerivationOCL=familiya' +
        '+'#39' '#39'+imya +'#39' '#39'+otchestvo\""'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1064#1072#1073#1083#1086#1085' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43BA2E4503A8,persistence=persistent,Bol' +
        'd.DelphiName=TShablon_zakaza,Bold.ExpressionName=Shablon_zakaza,' +
        'Bold.TableName=Shablon_zakaza,Bold.InterfaceName=IShablon_zakaza' +
        '"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1085#1072' '#1091#1083#1080#1094#1077'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440BCB1301E3,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_na_ulice,Bold.ExpressionName=' +
        'Nomer_na_ulice,Bold.DelphiName=Nomer_na_ulice"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1056#1072#1081#1086#1085'"'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43BA2F16002D,persistence=persistent,Bol' +
        'd.DelphiName=TRaion,Bold.ExpressionName=Raion,Bold.TableName=Rai' +
        'on,Bold.InterfaceName=IRaion"'
      #9#9#9'(Attributes'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1054#1073#1098#1077#1082#1090'"'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43BA314302AE,persistence=persistent,Bol' +
        'd.DelphiName=TObjekt,Bold.ExpressionName=Objekt,Bold.TableName=O' +
        'bjekt,Bold.InterfaceName=IObjekt"'
      #9#9#9'(Attributes'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1042#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9'"'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43BA3CF70231,persistence=persistent,Bol' +
        'd.DelphiName=TVoditelj,Bold.ExpressionName=Voditelj,Bold.TableNa' +
        'me=Voditelj,Bold.InterfaceName=IVoditelj"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1095#1072#1083#1086' '#1080#1085#1090#1077#1088#1074#1072#1083#1072' '#1088#1072#1089#1095#1105#1090#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440561F2000E,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Nachalo_intervala_raschyota,Bold.Expr' +
        'essionName=Nachalo_intervala_raschyota,Bold.DelphiName=Nachalo_i' +
        'ntervala_raschyota,\"Bold.DerivationOCL=if chem_uchityvaetsya_vo' +
        'ditelj->isEmpty then data_po_umolchaniyu else chem_uchityvaetsya' +
        '_voditelj.data_nachala endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1085#1077#1094' '#1080#1085#1090#1077#1088#1074#1072#1083#1072' '#1088#1072#1089#1095#1105#1090#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405620C0260,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Konec_intervala_raschyota,Bold.Expres' +
        'sionName=Konec_intervala_raschyota,Bold.DelphiName=Konec_interva' +
        'la_raschyota,\"Bold.DerivationOCL=if chem_uchityvaetsya_voditelj' +
        '->isEmpty then data_po_umolchaniyu else chem_uchityvaetsya_vodit' +
        'elj.data_konca endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1080#1085#1105#1089' '#1074#1089#1077#1075#1086'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440563ED00E9,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Prinyos_vsego,Bold.ExpressionName=Pri' +
        'nyos_vsego,Bold.DelphiName=Prinyos_vsego,Bold.DerivationOCL=prin' +
        'osit_dohod->collect(summa)->sum"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1080#1085#1105#1089' '#1079#1072' '#1087#1077#1088#1080#1086#1076'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44056415028F,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Prinyos_za_period,Bold.ExpressionName' +
        '=Prinyos_za_period,Bold.DelphiName=Prinyos_za_period,Bold.Deriva' +
        'tionOCL=prinosit_dohod->select(data_postupleniya>=self.nachalo_i' +
        'ntervala_raschyota)->select(data_postupleniya<self.konec_interva' +
        'la_raschyota)->collect(summa)->sum"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1077#1083#1080#1095#1080#1085#1072' '#1087#1088#1086#1094#1077#1085#1090#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440BD4EE00F9,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Velichina_procenta,Bold.ExpressionNam' +
        'e=Velichina_procenta,Bold.DelphiName=Velichina_procenta,\"Bold.D' +
        'erivationOCL=if individ_procent > 0 then individ_procent else\c\' +
        'lif chem_uchityvaetsya_voditelj->isEmpty then 0.0 else chem_uchi' +
        'tyvaetsya_voditelj.procent_otchisleniya endif\c\lendif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1086#1079#1099#1074#1085#1086#1081'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440BD7FB01D3,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Pozyvnoi,Bold.ExpressionName=Pozyvn' +
        'oi,Bold.DelphiName=Pozyvnoi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042' '#1088#1072#1073#1086#1090#1077'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440EE607031C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=V_rabote,Bold.ExpressionName=V_rabo' +
        'te,Bold.DelphiName=V_rabote"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072' '#1087#1077#1088#1077#1088#1099#1074#1077'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44170FB10148,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Na_pereryve,Bold.ExpressionName=Na_' +
        'pereryve,Bold.DelphiName=Na_pereryve"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1085#1076#1077#1082#1089' '#1086#1095#1077#1088#1105#1076#1085#1086#1089#1090#1080'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442958EC01B5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Indeks_ocheryodnosti,Bold.Expressio' +
        'nName=Indeks_ocheryodnosti,Bold.DelphiName=Indeks_ocheryodnosti"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44295C1B0186,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Nomer_sektora,Bold.ExpressionName=Nom' +
        'er_sektora,Bold.DelphiName=Nomer_sektora,Bold.DerivationOCL=rabo' +
        'taet_na_sektore.nomer_sektora"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442967CE0399,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_po_umolchaniyu,Bold.Expression' +
        'Name=Data_po_umolchaniyu,Bold.DelphiName=Data_po_umolchaniyu"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1087#1086#1089#1083' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444D50AE00EA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_posl_sektora,Bold.ExpressionN' +
        'ame=Nomer_posl_sektora,Bold.DelphiName=Nomer_posl_sektora"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1047#1072#1085#1103#1090' '#1076#1088#1091#1075#1080#1084' '#1076#1080#1089#1087'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444D50AE0138,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Zanyat_drugim_disp,Bold.ExpressionN' +
        'ame=Zanyat_drugim_disp,Bold.DelphiName=Zanyat_drugim_disp"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1088#1077#1084#1103' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1079#1072#1103#1074#1082#1080'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444D6A390213,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Vremya_posledne' +
        'i_zayavki,Bold.ExpressionName=Vremya_poslednei_zayavki,Bold.Delp' +
        'hiName=Vremya_poslednei_zayavki"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1071#1074#1083' '#1076#1077#1078#1091#1088#1085#1099#1084'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D84E7035B,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Yavl_degurnym,Bold.ExpressionName=Yav' +
        'l_degurnym,Bold.DelphiName=Yavl_degurnym,\"Bold.DerivationOCL=if' +
        ' familiya='#39#1057#1091#1090#1082#1080#39' then (1=1) else (1=0) endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1076#1077#1078' '#1075#1088#1091#1087#1087#1099'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D850F002E,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_deg_gruppy,Bold.ExpressionNam' +
        'e=Nomer_deg_gruppy,Bold.DelphiName=Nomer_deg_gruppy"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1052#1072#1088#1082#1072' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4470690F0148,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Marka_avtomobilya,Bold.ExpressionNa' +
        'me=Marka_avtomobilya,Bold.DelphiName=Marka_avtomobilya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1043#1086#1089' '#1085#1086#1084#1077#1088#1085#1086#1081' '#1079#1085#1072#1082'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4470694B031C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Gos_nomernoi_znak,Bold.ExpressionNa' +
        'me=Gos_nomernoi_znak,Bold.DelphiName=Gos_nomernoi_znak"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1043#1072#1088#1072#1078#1085' '#1085#1086#1084#1077#1088'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4470698B01E4,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Garagn_nomer,Bold.ExpressionName=Ga' +
        'ragn_nomer,Bold.DelphiName=Garagn_nomer"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1059#1076#1086#1089#1090#1086#1074#1077#1088#1077#1085#1080#1077' '#1085#1086#1084'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447069A601A5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Udostoverenie_nom,Bold.ExpressionNa' +
        'me=Udostoverenie_nom,Bold.DelphiName=Udostoverenie_nom"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1051#1080#1094#1077#1085#1079#1080#1086#1085#1085#1072#1103' '#1082#1072#1088#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"'#1044#1086#1075#1086#1074#1086#1088'"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447069C902DE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Licenzionnaya_kart,Bold.ExpressionN' +
        'ame=Licenzionnaya_kart,Bold.DelphiName=Licenzionnaya_kart"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1083#1072#1089#1089' '#1074#1099#1095'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447069FB0232,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Klass_vych,Bold.ExpressionName=Klass_' +
        'vych,Bold.DelphiName=Klass_vych,Bold.DerivationOCL=a_vych+b_vych' +
        '+s_vych+d_vych+e_vych+klass_vodit"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1083#1072#1089#1089' '#1074#1086#1076#1080#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44706A1F03C8,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Klass_vodit,Bold.ExpressionName=Kla' +
        'ss_vodit,Bold.DelphiName=Klass_vodit"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040' '#1082#1083#1072#1089#1089'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44706A360167,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=A_klass,Bold.ExpressionName=A_klass' +
        ',Bold.DelphiName=A_klass"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1041' '#1082#1083#1072#1089#1089'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44706A4601B5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=B_klass,Bold.ExpressionName=B_klass' +
        ',Bold.DelphiName=B_klass"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057' '#1082#1083#1072#1089#1089'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44706A5B00EA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=S_klass,Bold.ExpressionName=S_klass' +
        ',Bold.DelphiName=S_klass"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044' '#1082#1083#1072#1089#1089'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44706A7E02DE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=D_klass,Bold.ExpressionName=D_klass' +
        ',Bold.DelphiName=D_klass"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1045' '#1082#1083#1072#1089#1089'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44706A8E009C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=E_klass,Bold.ExpressionName=E_klass' +
        ',Bold.DelphiName=E_klass"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040' '#1074#1099#1095'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447070FB006D,persistence=transient,de' +
        'rived=True,Bold.ColumnName=A_vych,Bold.ExpressionName=A_vych,Bol' +
        'd.DelphiName=A_vych,\"Bold.DerivationOCL=if a_klass then '#39' A'#39' el' +
        'se '#39#39' endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1041' '#1074#1099#1095'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4470711603A9,persistence=transient,de' +
        'rived=True,Bold.ColumnName=B_vych,Bold.ExpressionName=B_vych,Bol' +
        'd.DelphiName=B_vych,\"Bold.DerivationOCL=if b_klass then '#39' B'#39' el' +
        'se '#39#39' endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057' '#1074#1099#1095'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4470712503A9,persistence=transient,de' +
        'rived=True,Bold.ColumnName=S_vych,Bold.ExpressionName=S_vych,Bol' +
        'd.DelphiName=S_vych,\"Bold.DerivationOCL=if s_klass then '#39' C'#39' el' +
        'se '#39#39' endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044' '#1074#1099#1095'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447071350222,persistence=transient,de' +
        'rived=True,Bold.ColumnName=D_vych,Bold.ExpressionName=D_vych,Bol' +
        'd.DelphiName=D_vych,\"Bold.DerivationOCL=if d_klass then '#39' D'#39' el' +
        'se '#39#39' endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1045' '#1074#1099#1095'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44707143008C,persistence=transient,de' +
        'rived=True,Bold.ColumnName=E_vych,Bold.ExpressionName=E_vych,Bol' +
        'd.DelphiName=E_vych,\"Bold.DerivationOCL=if d_klass then '#39' D'#39' el' +
        'se '#39#39' endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1079#1084' '#1093#1072#1088#1072#1082#1090#1088#1080#1089#1090'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=41D0600801C5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Izm_haraktrist,Bold.ExpressionName=' +
        'Izm_haraktrist,Bold.DelphiName=Izm_haraktrist"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1094#1074#1077#1090' '#1072#1074#1090#1086'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44CC9B9A0203,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=cvet_avto,Bold.ExpressionName=cvet_' +
        'avto,Bold.DelphiName=cvet_avto"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1090#1080#1087' '#1085#1086#1084#1077#1088' '#1088#1072#1094#1080#1080'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44CC9C760186,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=tip_nomer_racii,Bold.ExpressionName' +
        '=tip_nomer_racii,Bold.DelphiName=tip_nomer_racii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1085#1076#1080#1074#1080#1076' '#1087#1088#1086#1094#1077#1085#1090'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=455C4946008C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Individ_procent,Bold.ExpressionName' +
        '=Individ_procent,Bold.DelphiName=Individ_procent"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103'"'
      #9#9#9'"'#1055#1077#1088#1089#1086#1085#1072'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43CD5BA0032B,persistence=persistent,Bol' +
        'd.DelphiName=TOrganizaciya,Bold.ExpressionName=Organizaciya,Bold' +
        '.TableName=Organizaciya,Bold.InterfaceName=IOrganizaciya"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1090#1088#1072#1085#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"'#1056#1086#1089#1089#1080#1103' ('#1056#1060')"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B01B4,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Strana,Bold.ExpressionName=Strana,B' +
        'old.DelphiName=Strana,Bold.DefaultDBValue='#39#1056#1086#1089#1089#1080#1103#39'"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1073#1083#1072#1089#1090#1100'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"'#1050#1088#1072#1089#1085#1086#1076#1072#1088#1089#1082#1080#1081' '#1082#1088#1072#1081'"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B01F3,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Oblastj,Bold.ExpressionName=Oblastj' +
        ',Bold.DelphiName=Oblastj,\"Bold.DefaultDBValue='#39#1050#1088#1072#1089#1085#1086#1076#1072#1088#1089#1082#1080#1081' '#1082#1088 +
        #1072#1081#39'\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1043#1086#1088#1086#1076'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"'#1040#1085#1072#1087#1072'"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B0222,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Gorod,Bold.ExpressionName=Gorod,Bol' +
        'd.DelphiName=Gorod,Bold.DefaultDBValue='#39#1040#1085#1072#1087#1072#39'"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1041#1048#1050'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B0280,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=BIK,Bold.ExpressionName=BIK,Bold.De' +
        'lphiName=BIK"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B02BE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Naimenovanie,Bold.ExpressionName=Na' +
        'imenovanie,Bold.DelphiName=Naimenovanie"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1071#1074#1083#1103#1077#1090#1089#1103#1042#1083#1072#1076'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B02FD,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=YavlyaetsyaVlad,Bold.ExpressionName' +
        '=YavlyaetsyaVlad,Bold.DelphiName=YavlyaetsyaVlad"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B033B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Rukovoditelj,Bold.ExpressionName=Ru' +
        'kovoditelj,Bold.DelphiName=Rukovoditelj"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1043#1083#1041#1091#1093#1075#1072#1083#1090#1077#1088'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697B03D7,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=GlBuhgalter,Bold.ExpressionName=GlB' +
        'uhgalter,Bold.DelphiName=GlBuhgalter"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1053#1053'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697C002E,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=INN,Bold.ExpressionName=INN,Bold.De' +
        'lphiName=INN"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1089#1095'. '#1089#1095#1077#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697C007C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Rasch._schet,Bold.ExpressionName=Ra' +
        'sch._schet,Bold.DelphiName=Rasch._schet"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1055#1055'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697C00BA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=KPP,Bold.ExpressionName=KPP,Bold.De' +
        'lphiName=KPP"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1058#1080#1087' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697C0280,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Tip_organizacii,Bold.ExpressionName' +
        '=Tip_organizacii,Bold.DelphiName=Tip_organizacii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1088' '#1089#1095#1077#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697C02BE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kor_schet,Bold.ExpressionName=Kor_s' +
        'chet,Bold.DelphiName=Kor_schet"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1080#1084'. '#1073#1072#1085#1082#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43CD697C030C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Naim._banka,Bold.ExpressionName=Nai' +
        'm._banka,Bold.DelphiName=Naim._banka"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1055#1077#1088#1089#1086#1085#1072#1083'"'
      #9#9#9'"'#1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43BA3D0902BD,persistence=persistent,Bol' +
        'd.DelphiName=TPersonal,Bold.ExpressionName=Personal,Bold.TableNa' +
        'me=Personal,Bold.InterfaceName=IPersonal"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1051#1086#1075#1080#1085'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D421007B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Login,Bold.ExpressionName=Login,Bol' +
        'd.DelphiName=Login"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1072#1088#1086#1083#1100'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D421009B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Parolj,Bold.ExpressionName=Parolj,B' +
        'old.DelphiName=Parolj"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1072#1074#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D42100BA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Prava,Bold.ExpressionName=Prava,Bol' +
        'd.DelphiName=Prava"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D42100D9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kommentarii,Bold.ExpressionName=Kom' +
        'mentarii,Bold.DelphiName=Kommentarii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1089#1105'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D44302FC,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razreshitj_vsyo,Bold.ExpressionName' +
        '=Razreshitj_vsyo,Bold.DelphiName=Razreshitj_vsyo"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088#1077#1096' '#1072#1076#1084#1080#1085#1080#1089#1090#1088'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D46700F8,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razresh_administr,Bold.ExpressionNa' +
        'me=Razresh_administr,Bold.DelphiName=Razresh_administr"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088#1077#1096' '#1085#1072#1089#1090#1088#1086#1081#1082#1091' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D4810250,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razresh_nastroiku_raboty,Bold.Expre' +
        'ssionName=Razresh_nastroiku_raboty,Bold.DelphiName=Razresh_nastr' +
        'oiku_raboty"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1083#1086#1075#1086#1074'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3D4E900D9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razreshitj_prosmotr_logov,Bold.Expr' +
        'essionName=Razreshitj_prosmotr_logov,Bold.DelphiName=Razreshitj_' +
        'prosmotr_logov"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088' '#1088#1072#1073#1086#1090#1091' '#1089' '#1072#1088#1093#1080#1074#1086#1084'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DC8501D3,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razr_rabotu_s_arhivom,Bold.Expressi' +
        'onName=Razr_rabotu_s_arhivom,Bold.DelphiName=Razr_rabotu_s_arhiv' +
        'om"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1074#1099#1087#1091#1089#1082#1086#1074'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DCC0027F,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razreshitj_udalenie_vypuskov,Bold.E' +
        'xpressionName=Razreshitj_udalenie_vypuskov,Bold.DelphiName=Razre' +
        'shitj_udalenie_vypuskov"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1088#1072#1079#1076#1077#1083#1086#1074'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DCF202EC,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razr_udalenie_razdelov,Bold.Express' +
        'ionName=Razr_udalenie_razdelov,Bold.DelphiName=Razr_udalenie_raz' +
        'delov"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1081'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DD4D03C7,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razreshitj_udalenie_objyavlenii,Bol' +
        'd.ExpressionName=Razreshitj_udalenie_objyavlenii,Bold.DelphiName' +
        '=Razreshitj_udalenie_objyavlenii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077' '#1086#1089#1090#1072#1083#1100#1085#1086#1075#1086'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DD7502DD,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razreshitj_udalenie_ostaljnogo,Bold' +
        '.ExpressionName=Razreshitj_udalenie_ostaljnogo,Bold.DelphiName=R' +
        'azreshitj_udalenie_ostaljnogo"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088' '#1087#1088#1072#1074' '#1088#1077#1076#1082#1086#1084#1077#1085' '#1089#1087#1088#1072#1074'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3E7E20195,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razr_prav_redkomen_sprav,Bold.Expre' +
        'ssionName=Razr_prav_redkomen_sprav,Bold.DelphiName=Razr_prav_red' +
        'komen_sprav"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1072#1079#1088' '#1087#1088#1072#1074' '#1086#1087#1077#1088' '#1088#1072#1079#1076#1077#1083#1086#1074'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43F453560108,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Razr_prav_oper_razdelov,Bold.Expres' +
        'sionName=Razr_prav_oper_razdelov,Bold.DelphiName=Razr_prav_oper_' +
        'razdelov"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1076#1077#1085#1090' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4455C28902EE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Ident_dispetchera,Bold.ExpressionNa' +
        'me=Ident_dispetchera,Bold.DelphiName=Ident_dispetchera"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1084#1103' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"'#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1105#1085'"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4455C2FB035B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Imya_dispetchera,Bold.ExpressionNam' +
        'e=Imya_dispetchera,Bold.DelphiName=Imya_dispetchera"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1045#1089#1090#1100' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4455C340001F,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Estj_otpravlennye,Bold.ExpressionNa' +
        'me=Estj_otpravlennye,Bold.DelphiName=Estj_otpravlennye"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1045#1089#1090#1100' '#1085#1072#1095#1072#1090#1099#1077'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4455C340005D,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Estj_nachatye,Bold.ExpressionName=E' +
        'stj_nachatye,Bold.DelphiName=Estj_nachatye"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1095#1072#1083#1086' '#1080#1085#1090#1077#1088#1074#1072#1083#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445EF42C002E,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Nachalo_intervala,Bold.ExpressionName' +
        '=Nachalo_intervala,Bold.DelphiName=Nachalo_intervala,Bold.Deriva' +
        'tionOCL=chem_uchityvaetsya_dispetcher.data_nachala"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1085#1077#1094' '#1080#1085#1090#1077#1088#1074#1072#1083#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445EF437005D,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Konec_intervala,Bold.ExpressionName=K' +
        'onec_intervala,Bold.DelphiName=Konec_intervala,Bold.DerivationOC' +
        'L=chem_uchityvaetsya_dispetcher.data_konca"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1047#1072#1103#1074' '#1079#1072' '#1080#1085#1090#1077#1088#1074#1072#1083'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445EF4B00128,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Zayav_za_interval,Bold.ExpressionName' +
        '=Zayav_za_interval,Bold.DelphiName=Zayav_za_interval,\"Bold.Deri' +
        'vationOCL=perechenj_zakazov->select(nachalo_zakaza_data>=self.na' +
        'chalo_intervala)->select(nachalo_zakaza_data<=self.konec_interva' +
        'la)->select(not arhivnyi and zavershyon and not soobsheno_vodite' +
        'lyu)->size\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1084#1084#1072' '#1079#1072' '#1080#1085#1090#1077#1088#1074#1072#1083'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445EF4E401C5,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Summa_za_interval,Bold.ExpressionName' +
        '=Summa_za_interval,Bold.DelphiName=Summa_za_interval,\"Bold.Deri' +
        'vationOCL=perechenj_zakazov->select(nachalo_zakaza_data>=self.na' +
        'chalo_intervala)->select(nachalo_zakaza_data<=self.konec_interva' +
        'la)->select(not arhivnyi and zavershyon and not soobsheno_vodite' +
        'lyu)->collect(stoimostj_so_skidkoi)->sum\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"HasRefreshData"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44755DA900AB,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=HasRefreshData,Bold.ExpressionName=' +
        'HasRefreshData,Bold.DelphiName=HasRefreshData"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"UserEntered"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44755DEE03D8,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=UserEntered,Bold.ExpressionName=Use' +
        'rEntered,Bold.DelphiName=UserEntered"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1045#1089#1090#1100#1042#1085#1077#1096#1085#1080#1077#1052#1072#1085#1080#1087'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=41D01CE3037A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=EstjVneshnieManip,Bold.ExpressionNa' +
        'me=EstjVneshnieManip,Bold.DelphiName=EstjVneshnieManip"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1086#1083#1100' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFBA42004E,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Rolj_dispetchera,Bold.ExpressionNam' +
        'e=Rolj_dispetchera,Bold.DelphiName=Rolj_dispetchera"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1080#1076#1080#1090' '#1074#1089#1077#1093'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=453F898B0271,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Vidit_vseh,Bold.ExpressionName=Vidi' +
        't_vseh,Bold.DelphiName=Vidit_vseh"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1086#1074#1077#1088' '#1074#1086#1076#1080#1090'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4540C1BB006D,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Prover_vodit,Bold.ExpressionName=Pr' +
        'over_vodit,Bold.DelphiName=Prover_vodit"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1059#1083#1080#1094#1072'"'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43BA3FD80156,persistence=persistent,Bol' +
        'd.DelphiName=TUlica,Bold.ExpressionName=Ulica,Bold.TableName=Uli' +
        'ca,Bold.InterfaceName=IUlica"'
      #9#9#9'(Attributes'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1050#1083#1072#1089#1089' '#1087#1086#1080#1089#1082#1072'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43BA443403C7,persistence=persistent,Bol' +
        'd.DelphiName=TKlass_poiska,Bold.ExpressionName=Klass_poiska,Bold' +
        '.TableName=Klass_poiska,Bold.InterfaceName=IKlass_poiska"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1089#1082#1072#1090#1100' '#1087#1086' '#1082#1083#1080#1077#1085#1090#1091'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA454F02FC,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Iskatj_po_klientu,Bold.ExpressionNa' +
        'me=Iskatj_po_klientu,Bold.DelphiName=Iskatj_po_klientu"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1084#1103' '#1082#1083#1080#1077#1085#1090#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA456D032B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Imya_klienta,Bold.ExpressionName=Im' +
        'ya_klienta,Bold.DelphiName=Imya_klienta"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1060#1072#1084#1080#1083#1080#1103' '#1082#1083#1080#1077#1085#1090#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA45740398,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Familiya_klienta,Bold.ExpressionName=' +
        'Familiya_klienta,Bold.DelphiName=Familiya_klienta"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1090#1095#1077#1089#1090#1074#1086' '#1082#1083#1080#1077#1085#1090#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA45A9007B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Otchestvo_klienta,Bold.ExpressionNa' +
        'me=Otchestvo_klienta,Bold.DelphiName=Otchestvo_klienta"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1089#1082#1072#1090#1100' '#1087#1086' '#1082#1083#1102#1095' '#1089#1083#1086#1074#1072#1084'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA45C200C9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Iskatj_po_klyuch_slovam,Bold.Expres' +
        'sionName=Iskatj_po_klyuch_slovam,Bold.DelphiName=Iskatj_po_klyuc' +
        'h_slovam"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1083#1102#1095' '#1089#1083#1086#1074#1086'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA468E0250,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Klyuch_slovo,Bold.ExpressionName=Kl' +
        'yuch_slovo,Bold.DelphiName=Klyuch_slovo"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1089#1082#1072#1090#1100' '#1087#1086' '#1076#1072#1090#1077' '#1076#1086#1073'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA474403B7,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Iskatj_po_date_dob,Bold.ExpressionN' +
        'ame=Iskatj_po_date_dob,Bold.DelphiName=Iskatj_po_date_dob"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057' '#1076#1072#1090#1099' '#1076#1086#1073'"'
      #9#9#9#9#9'"Date"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA476801D3,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=S_daty_dob,Bold.ExpressionName=S_da' +
        'ty_dob,Bold.DelphiName=S_daty_dob"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1086' '#1076#1072#1090#1091' '#1076#1086#1073'"'
      #9#9#9#9#9'"Date"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA477201D3,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Po_datu_dob,Bold.ExpressionName=Po_' +
        'datu_dob,Bold.DelphiName=Po_datu_dob"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1077#1075' '#1076#1072#1090#1072'"'
      #9#9#9#9#9'"Date"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA4E860231,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Seg_data,Bold.ExpressionName=Seg_da' +
        'ta,Bold.DelphiName=Seg_data"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1089#1083#1077#1076' '#1074#1099#1087'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA4EA702EC,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_sled_vyp,Bold.ExpressionName=' +
        'Nomer_sled_vyp,Bold.DelphiName=Nomer_sled_vyp"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1043#1086#1076' '#1089#1083#1077#1076' '#1074#1099#1087'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA4EB701F2,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=God_sled_vyp,Bold.ExpressionName=Go' +
        'd_sled_vyp,Bold.DelphiName=God_sled_vyp"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1089#1083#1077#1076' '#1074#1099#1087'"'
      #9#9#9#9#9'"Date"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA4EC703D7,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_sled_vyp,Bold.ExpressionName=D' +
        'ata_sled_vyp,Bold.DelphiName=Data_sled_vyp"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1089#1082#1072#1090#1100' '#1076#1074#1086#1081#1085#1080#1082#1086#1074'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43BA4F2700BA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Iskatj_dvoinikov,Bold.ExpressionNam' +
        'e=Iskatj_dvoinikov,Bold.DelphiName=Iskatj_dvoinikov"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1058#1077#1082' '#1080#1079#1076#1072#1085#1080#1077' '#1080#1076#1077#1085#1090'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43D26F080379,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Tek_izdanie_ident,Bold.ExpressionNa' +
        'me=Tek_izdanie_ident,Bold.DelphiName=Tek_izdanie_ident"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1051#1086#1075' '#1086#1087#1077#1088#1072#1094#1080#1080'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=43E3DDF002FC,persistence=persistent,Bol' +
        'd.DelphiName=TLog_operacii,Bold.ExpressionName=Log_operacii,Bold' +
        '.TableName=Log_operacii,Bold.InterfaceName=ILog_operacii"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DE0E0195,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Naimenovanie_operacii,Bold.Expressi' +
        'onName=Naimenovanie_operacii,Bold.DelphiName=Naimenovanie_operac' +
        'ii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1073#1098#1077#1082#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DE1A0137,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Subjekt,Bold.ExpressionName=Subjekt,B' +
        'old.DelphiName=Subjekt,Bold.DerivationOCL=ot_deistvii.polnoe_imy' +
        'a"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DE5100BA,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Data_i_vremya,Bold.ExpressionName=Dat' +
        'a_i_vremya,Bold.DelphiName=Data_i_vremya,\"Bold.DerivationOCL=da' +
        'ta.asString +'#39'  '#39'+vremya\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072'"'
      #9#9#9#9#9'"Date"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DED700BA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data,Bold.ExpressionName=Data,Bold.' +
        'DelphiName=Data"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1088#1077#1084#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DEF30146,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Vremya,Bold.ExpressionName=Vremya,B' +
        'old.DelphiName=Vremya"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1057#1090#1086#1080#1084#1086#1089#1090#1100'"'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44032B09027F,persistence=persistent,Bol' +
        'd.DelphiName=TStoimostj,Bold.ExpressionName=Stoimostj,Bold.Table' +
        'Name=Stoimostj,Bold.InterfaceName=IStoimostj"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1090#1086#1080#1084#1086#1089#1090#1100'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44094EE10118,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Stoimostj,Bold.ExpressionName=Stoim' +
        'ostj,Bold.DelphiName=Stoimostj"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9'"'#1064#1072#1073#1083#1086#1085' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44032B4E000E,persistence=persistent,Bol' +
        'd.DelphiName=TZakaz,Bold.ExpressionName=Zakaz,Bold.TableName=Zak' +
        'az,Bold.InterfaceName=IZakaz"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1095#1072#1089#1086#1074'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44055C6C0195,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kolichestvo_chasov,Bold.ExpressionN' +
        'ame=Kolichestvo_chasov,Bold.DelphiName=Kolichestvo_chasov"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1095#1072#1083#1086' '#1079#1072#1082#1072#1079#1072' '#1076#1072#1090#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44055C7E007B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nachalo_zakaza_data,Bold.Expression' +
        'Name=Nachalo_zakaza_data,Bold.DelphiName=Nachalo_zakaza_data"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1085#1077#1094' '#1079#1072#1082#1072#1079#1072' '#1076#1072#1090#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44055D0A0260,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Konec_zakaza_data,Bold.ExpressionNa' +
        'me=Konec_zakaza_data,Bold.DelphiName=Konec_zakaza_data"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1058#1077#1083#1077#1092#1086#1085' '#1082#1083#1080#1077#1085#1090#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44055DB200F8,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Telefon_klienta,Bold.ExpressionName' +
        '=Telefon_klienta,Bold.DelphiName=Telefon_klienta"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44055E8B02FC,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Stoimostj_zakaza,Bold.ExpressionName=' +
        'Stoimostj_zakaza,Bold.DelphiName=Stoimostj_zakaza,\"Bold.Derivat' +
        'ionOCL=if nomer_skidki=1 then (stoimostj_so_skidkoi*Objekt_vybor' +
        'ki_otchyotnosti.allInstances->first.koeff_prizov_sbavki_1+Objekt' +
        '_vyborki_otchyotnosti.allInstances->first.velichina_priz_sbavki_' +
        '1) \c\lelse if nomer_skidki=2 then (stoimostj_so_skidkoi*Objekt_' +
        'vyborki_otchyotnosti.allInstances->first.koeff_prizov_sbavki_2+O' +
        'bjekt_vyborki_otchyotnosti.allInstances->first.velichina_priz_sb' +
        'avki_2) \c\lelse if nomer_skidki=3 then (stoimostj_so_skidkoi*Ob' +
        'jekt_vyborki_otchyotnosti.allInstances->first.koeff_prizov_sbavk' +
        'i_3+Objekt_vyborki_otchyotnosti.allInstances->first.velichina_pr' +
        'iz_sbavki_3) else \c\lstoimostj_so_skidkoi endif endif endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440574C800AA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_zakaza,Bold.ExpressionName=No' +
        'mer_zakaza,Bold.DelphiName=Nomer_zakaza"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1086#1076#1072#1095#1080'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4408573D03C7,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_podachi,Bold.ExpressionName=Da' +
        'ta_podachi,Bold.DelphiName=Data_podachi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1047#1072#1074#1077#1088#1096#1105#1085'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4409771D0118,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Zavershyon,Bold.ExpressionName=Zave' +
        'rshyon,Bold.DelphiName=Zavershyon"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1088#1093#1080#1074#1085#1099#1081'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44097C520137,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Arhivnyi,Bold.ExpressionName=Arhivn' +
        'yi,Bold.DelphiName=Arhivnyi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1059#1089#1083#1086#1074#1085' '#1089#1090#1086#1080#1084'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440AB2C5000F,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Uslovn_stoim,Bo' +
        'ld.ExpressionName=Uslovn_stoim,Bold.DelphiName=Uslovn_stoim"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1076#1088#1077#1089' '#1074#1099#1079#1086#1074#1072' '#1074#1074#1086#1076#1080#1084'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440EB677036B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Adres_vyzova_vvodim,Bold.Expression' +
        'Name=Adres_vyzova_vvodim,Bold.DelphiName=Adres_vyzova_vvodim"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44170E690242,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Predvariteljnyi,Bold.ExpressionName' +
        '=Predvariteljnyi,Bold.DelphiName=Predvariteljnyi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1072#1103'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44170EB50280,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_predvariteljnaya,Bold.Expressi' +
        'onName=Data_predvariteljnaya,Bold.DelphiName=Data_predvariteljna' +
        'ya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1047#1072#1076#1077#1081#1089#1090#1074' '#1087#1088#1077#1076#1074#1072#1088#1080#1090'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44170F0E001F,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Zadeistv_predvarit,Bold.ExpressionN' +
        'ame=Zadeistv_predvarit,Bold.DelphiName=Zadeistv_predvarit"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4429679A0251,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_po_umolchaniyu,Bold.Expression' +
        'Name=Data_po_umolchaniyu,Bold.DelphiName=Data_po_umolchaniyu"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1086#1086#1073#1097#1077#1085#1086' '#1074#1086#1076#1080#1090#1077#1083#1102'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442A929F0119,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Soobsheno_voditelyu,Bold.Expression' +
        'Name=Soobsheno_voditelyu,Bold.DelphiName=Soobsheno_voditelyu"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1076#1088#1077#1089' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1079#1072#1103#1074#1082#1080'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444BA76C02FD,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Adres_okonchaniya_zayavki,Bold.Expr' +
        'essionName=Adres_okonchaniya_zayavki,Bold.DelphiName=Adres_okonc' +
        'haniya_zayavki"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1071#1074#1083'_'#1087#1086#1095#1072#1089#1086#1074#1099#1084'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44055C300379,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Yavl_pochasovym,Bold.ExpressionName' +
        '=Yavl_pochasovym,Bold.DelphiName=Yavl_pochasovym"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444BB56D02CE,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Stoimostj_so_skidkoi,Bold.ExpressionN' +
        'ame=Stoimostj_so_skidkoi,Bold.DelphiName=Stoimostj_so_skidkoi,\"' +
        'Bold.DerivationOCL=if kolichestvo_chasov>0 then uslovn_stoim*kol' +
        'ichestvo_chasov  else uslovn_stoim endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1086#1079#1099#1074#1085#1086#1081' '#1091#1089#1090#1072#1085'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444D9BA801A5,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Pozyvnoi_ustan,' +
        'Bold.ExpressionName=Pozyvnoi_ustan,Bold.DelphiName=Pozyvnoi_usta' +
        'n"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1088#1080#1073#1099#1090#1080#1077'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447D9D950290,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data_pribytie,B' +
        'old.ExpressionName=Data_pribytie,Bold.DelphiName=Data_pribytie"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1059#1089#1090#1072#1085' '#1087#1088#1080#1073#1099#1090#1080#1077'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=41D5930A00DA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Ustan_pribytie,Bold.ExpressionName=' +
        'Ustan_pribytie,Bold.DelphiName=Ustan_pribytie"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1089#1082#1080#1076#1082#1080'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=41D5979B0242,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_skidki,Bold.ExpressionName=No' +
        'mer_skidki,Bold.DelphiName=Nomer_skidki"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1083#1091#1078#1077#1073#1085#1099#1081'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FC225A000F,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Slugebnyi,Bold.ExpressionName=Sluge' +
        'bnyi,Bold.DelphiName=Slugebnyi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FC226F02FD,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Primechanie,Bold.ExpressionName=Pri' +
        'mechanie,Bold.DelphiName=Primechanie"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1087#1088' '#1089' '#1086#1073#1097' '#1083#1080#1085#1080#1080'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4568132502BF,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Opr_s_obsh_linii,Bold.ExpressionNam' +
        'e=Opr_s_obsh_linii,Bold.DelphiName=Opr_s_obsh_linii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1085#1072' '#1090#1086#1095#1082#1077'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=456EA3020261,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data_na_tochke,' +
        'Bold.ExpressionName=Data_na_tochke,Bold.DelphiName=Data_na_tochk' +
        'e"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1052#1072#1096#1080#1085#1072'"'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44032BDA00BA,persistence=persistent,Bol' +
        'd.DelphiName=TMashina,Bold.ExpressionName=Mashina,Bold.TableName' +
        '=Mashina,Bold.InterfaceName=IMashina"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1052#1086#1076#1077#1083#1100'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440EE64902DE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Modelj,Bold.ExpressionName=Modelj,B' +
        'old.DelphiName=Modelj"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1042#1099#1088#1091#1095#1082#1072' '#1086#1090' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      #9#9#9'"'#1055#1088#1080#1093#1086#1076'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=440560C40379,persistence=persistent,Bol' +
        'd.DelphiName=TVyruchka_ot_voditelya,Bold.ExpressionName=Vyruchka' +
        '_ot_voditelya,Bold.TableName=Vyruchka_ot_voditelya,Bold.Interfac' +
        'eName=IVyruchka_ot_voditelya"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1084#1084#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440560EA035A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Summa,Bold.ExpressionName=Summa,Bol' +
        'd.DelphiName=Summa"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44056126003D,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data_postupleni' +
        'ya,Bold.ExpressionName=Data_postupleniya,Bold.DelphiName=Data_po' +
        'stupleniya"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1055#1088#1080#1093#1086#1076'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44FD7217032C,persistence=persistent,Bol' +
        'd.DelphiName=TPrihod,Bold.ExpressionName=Prihod,Bold.TableName=P' +
        'rihod,Bold.InterfaceName=IPrihod"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1084#1084#1072' '#1087#1086#1079#1080#1094#1080#1080'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFEFC400BB,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Summa_pozicii,Bold.ExpressionName=S' +
        'umma_pozicii,Bold.DelphiName=Summa_pozicii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1088#1080#1093#1086#1076#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFE0650177,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data_prihoda,Bo' +
        'ld.ExpressionName=Data_prihoda,Bold.DelphiName=Data_prihoda"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1087#1080#1089#1072#1085#1080#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFE08D03A9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Opisanie,Bold.ExpressionName=Opisan' +
        'ie,Bold.DelphiName=Opisanie"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1054#1073#1098#1077#1082#1090' '#1074#1099#1073#1086#1088#1082#1080' '#1086#1090#1095#1105#1090#1085#1086#1089#1090#1080'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=4405650C01E3,persistence=persistent,Bol' +
        'd.DelphiName=TObjekt_vyborki_otchyotnosti,Bold.ExpressionName=Ob' +
        'jekt_vyborki_otchyotnosti,Bold.TableName=Objekt_vyborki_otchyotn' +
        'osti,Bold.InterfaceName=IObjekt_vyborki_otchyotnosti"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405656A004C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Tip_objekta,Bold.ExpressionName=Tip' +
        '_objekta,Bold.DelphiName=Tip_objekta"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440565850175,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_nachala,Bold.ExpressionName=Da' +
        'ta_nachala,Bold.DelphiName=Data_nachala"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1082#1086#1085#1094#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440565BF00D9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_konca,Bold.ExpressionName=Data' +
        '_konca,Bold.DelphiName=Data_konca"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1086#1094#1077#1085#1090' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1103'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405664402AE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Procent_otchisleniya,Bold.Expressio' +
        'nName=Procent_otchisleniya,Bold.DelphiName=Procent_otchisleniya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1060#1080#1083#1100#1090#1088' '#1087#1086#1079#1099#1074#1085#1086#1081'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440574060127,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Filjtr_pozyvnoi,Bold.ExpressionName' +
        '=Filjtr_pozyvnoi,Bold.DelphiName=Filjtr_pozyvnoi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1060#1080#1083#1100#1090#1088' '#1076#1072#1090#1072' '#1085#1072#1095#1072#1083#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405747D00BA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Filjtr_data_nachala,Bold.Expression' +
        'Name=Filjtr_data_nachala,Bold.DelphiName=Filjtr_data_nachala"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1060#1080#1083#1100#1090#1088' '#1076#1072#1090#1072' '#1082#1086#1085#1094#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440574900240,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Filjtr_data_konca,Bold.ExpressionNa' +
        'me=Filjtr_data_konca,Bold.DelphiName=Filjtr_data_konca"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1062#1074#1077#1090' '#1087#1088#1080#1085#1103#1090#1099#1093'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44080F3D0166,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Cvet_prinyatyh,Bold.ExpressionName=' +
        'Cvet_prinyatyh,Bold.DelphiName=Cvet_prinyatyh"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1062#1074#1077#1090' '#1085#1072#1095#1072#1074#1096#1080#1093#1089#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44080F6D0137,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Cvet_nachavshihsya,Bold.ExpressionN' +
        'ame=Cvet_nachavshihsya,Bold.DelphiName=Cvet_nachavshihsya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1062#1074#1077#1090' '#1086#1082#1086#1085#1095#1080#1074#1096#1080#1093#1089#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44080FAB03E7,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Cvet_okonchivshihsya,Bold.Expressio' +
        'nName=Cvet_okonchivshihsya,Bold.DelphiName=Cvet_okonchivshihsya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1085#1077#1089#1082' '#1076#1085#1077#1081'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440C71A7035A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Vybratj_poslednie_nesk_dnei,Bold.Ex' +
        'pressionName=Vybratj_poslednie_nesk_dnei,Bold.DelphiName=Vybratj' +
        '_poslednie_nesk_dnei"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1083' '#1087#1086#1089#1083' '#1076#1085#1077#1081'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"2"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440C745C035A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kol_posl_dnei,Bold.ExpressionName=K' +
        'ol_posl_dnei,Bold.DelphiName=Kol_posl_dnei"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1086#1089#1083' '#1076#1072#1090#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440C74D30241,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Posl_data,Bold.ExpressionName=Posl_da' +
        'ta,Bold.DelphiName=Posl_data,\"Bold.DerivationOCL=if  Zakaz.allI' +
        'nstances->size>0 then Zakaz.allInstances->orderby(data_podachi)-' +
        '>last.data_podachi else data_po_umolchaniyu endif\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1084#1080#1085#1091#1089' '#1074#1099#1073#1080#1088' '#1076#1085#1080'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440C74EF034A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_minus_vybir_dni,Bold.Expressio' +
        'nName=Data_minus_vybir_dni,Bold.DelphiName=Data_minus_vybir_dni"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1087#1086#1079#1099#1074#1085#1086#1081' '#1092#1080#1083#1100#1090#1088'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4410A7E700DA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_pozyvnoi_filjtr,Bold.Expressi' +
        'onName=Nomer_pozyvnoi_filjtr,Bold.DelphiName=Nomer_pozyvnoi_filj' +
        'tr"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1062#1074#1077#1090' '#1087#1088#1077#1076#1074#1072#1088#1080#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44170F4D0000,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Cvet_predvarit,Bold.ExpressionName=' +
        'Cvet_predvarit,Bold.DelphiName=Cvet_predvarit"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442967DA00EA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Data_po_umolchaniyu,Bold.Expression' +
        'Name=Data_po_umolchaniyu,Bold.DelphiName=Data_po_umolchaniyu"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1074#1090#1086#1079#1072#1087#1086#1083#1085' '#1089#1077#1082#1090#1086#1088#1086#1074'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442AD3A40251,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Avtozapoln_sektorov,Bold.Expression' +
        'Name=Avtozapoln_sektorov,Bold.DelphiName=Avtozapoln_sektorov"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1079#1085#1072#1095' '#1080#1079' '#1086#1073#1097'  '#1089#1087#1080#1089#1082#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442A6BEB0222,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Naznach_iz_obsh__spiska,Bold.Expres' +
        'sionName=Naznach_iz_obsh__spiska,Bold.DelphiName=Naznach_iz_obsh' +
        '__spiska"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"rep_time"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44326C4B038A,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=rep_time,Bold.E' +
        'xpressionName=rep_time,Bold.DelphiName=rep_time"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1074#1090#1086#1079#1072#1087' '#1082#1086#1085#1077#1095#1085' '#1089#1077#1082#1090'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=443290BB0196,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Avtozap_konechn_sekt,Bold.Expressio' +
        'nName=Avtozap_konechn_sekt,Bold.DelphiName=Avtozap_konechn_sekt"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1074#1090#1086#1079#1072#1087' '#1085#1072#1095' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4432913E0280,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Avtozap_nach_sektora,Bold.Expressio' +
        'nName=Avtozap_nach_sektora,Bold.DelphiName=Avtozap_nach_sektora"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1047#1072#1087#1088#1086#1089' '#1085#1072#1095' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44329153000F,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Zapros_nach_sektora,Bold.Expression' +
        'Name=Zapros_nach_sektora,Bold.DelphiName=Zapros_nach_sektora"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1047#1072#1087#1088#1086#1089' '#1082#1086#1085#1077#1095' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4432916D0280,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Zapros_konech_sektora,Bold.Expressi' +
        'onName=Zapros_konech_sektora,Bold.DelphiName=Zapros_konech_sekto' +
        'ra"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1086#1086#1073#1097' '#1086' '#1085#1077#1090#1086#1095#1085' '#1089#1077#1082#1090' '#1088#1077#1078'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=443291F401F4,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Soobsh_o_netochn_sekt_reg,Bold.Expr' +
        'essionName=Soobsh_o_netochn_sekt_reg,Bold.DelphiName=Soobsh_o_ne' +
        'tochn_sekt_reg"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1080#1079#1086#1074#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' 1"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A59EC03B9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Prizovoe_kolichestvo_1,Bold.Express' +
        'ionName=Prizovoe_kolichestvo_1,Bold.DelphiName=Prizovoe_koliches' +
        'tvo_1"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1080#1079#1086#1074#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' 2"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5A1D037A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Prizovoe_kolichestvo_2,Bold.Express' +
        'ionName=Prizovoe_kolichestvo_2,Bold.DelphiName=Prizovoe_koliches' +
        'tvo_2"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1088#1080#1079#1086#1074#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' 3"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5A5D005D,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Prizovoe_kolichestvo_3,Bold.Express' +
        'ionName=Prizovoe_kolichestvo_3,Bold.DelphiName=Prizovoe_koliches' +
        'tvo_3"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1077#1092#1092' '#1087#1088#1080#1079#1086#1074' '#1089#1073#1072#1074#1082#1080' 1"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5A6C0213,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Koeff_prizov_sbavki_1,Bold.Expressi' +
        'onName=Koeff_prizov_sbavki_1,Bold.DelphiName=Koeff_prizov_sbavki' +
        '_1"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1077#1083#1080#1095#1080#1085#1072' '#1087#1088#1080#1079' '#1089#1073#1072#1074#1082#1080' 1"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5A97035B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Velichina_priz_sbavki_1,Bold.Expres' +
        'sionName=Velichina_priz_sbavki_1,Bold.DelphiName=Velichina_priz_' +
        'sbavki_1"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1077#1092#1092' '#1087#1088#1080#1079#1086#1074' '#1089#1073#1072#1074#1082#1080' 2"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5B2D003E,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Koeff_prizov_sbavki_2,Bold.Expressi' +
        'onName=Koeff_prizov_sbavki_2,Bold.DelphiName=Koeff_prizov_sbavki' +
        '_2"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1077#1083#1080#1095#1080#1085#1072' '#1087#1088#1080#1079' '#1089#1073#1072#1074#1082#1080' 2"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5B2D009C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Velichina_priz_sbavki_2,Bold.Expres' +
        'sionName=Velichina_priz_sbavki_2,Bold.DelphiName=Velichina_priz_' +
        'sbavki_2"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1077#1092#1092' '#1087#1088#1080#1079#1086#1074' '#1089#1073#1072#1074#1082#1080' 3"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5B2F0138,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Koeff_prizov_sbavki_3,Bold.Expressi' +
        'onName=Koeff_prizov_sbavki_3,Bold.DelphiName=Koeff_prizov_sbavki' +
        '_3"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1077#1083#1080#1095#1080#1085#1072' '#1087#1088#1080#1079' '#1089#1073#1072#1074#1082#1080' 3"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5B2F0196,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Velichina_priz_sbavki_3,Bold.Expres' +
        'sionName=Velichina_priz_sbavki_3,Bold.DelphiName=Velichina_priz_' +
        'sbavki_3"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1089#1087#1086#1083#1100#1079' '#1087#1088#1080#1079' 1"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5C930242,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Ispoljz_priz_1,Bold.ExpressionName=' +
        'Ispoljz_priz_1,Bold.DelphiName=Ispoljz_priz_1"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1089#1087#1086#1083#1100#1079' '#1087#1088#1080#1079' 2"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5CB10138,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Ispoljz_priz_2,Bold.ExpressionName=' +
        'Ispoljz_priz_2,Bold.DelphiName=Ispoljz_priz_2"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1048#1089#1087#1086#1083#1100#1079' '#1087#1088#1080#1079' 3"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5CB30222,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Ispoljz_priz_3,Bold.ExpressionName=' +
        'Ispoljz_priz_3,Bold.DelphiName=Ispoljz_priz_3"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1056#1077#1078#1080#1084' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444DC12900EA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Regim_dispetchera,Bold.ExpressionNa' +
        'me=Regim_dispetchera,Bold.DelphiName=Regim_dispetchera"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1045#1089#1090#1100' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4455BDAE035B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Estj_otpravlennye,Bold.ExpressionNa' +
        'me=Estj_otpravlennye,Bold.DelphiName=Estj_otpravlennye"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1045#1089#1090#1100' '#1085#1072#1095#1072#1090#1099#1077'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4455BDCB005D,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Estj_nachatye,Bold.ExpressionName=E' +
        'stj_nachatye,Bold.DelphiName=Estj_nachatye"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1077' '#1091#1095#1080#1090' '#1079#1072#1085#1103#1090' '#1076#1088#1091#1075' '#1076#1080#1089#1087'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4455DD7902BF,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Ne_uchit_zanyat_drug_disp,Bold.Expr' +
        'essionName=Ne_uchit_zanyat_drug_disp,Bold.DelphiName=Ne_uchit_za' +
        'nyat_drug_disp"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1083#1080#1095' '#1076#1077#1078' '#1075#1088#1091#1087#1087'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D85B20232,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kolich_deg_grupp,Bold.ExpressionNam' +
        'e=Kolich_deg_grupp,Bold.DelphiName=Kolich_deg_grupp"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1058#1077#1082' '#1076#1077#1078' '#1075#1088#1091#1087#1087#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"1"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D85EA0222,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Tek_deg_gruppa,Bold.ExpressionName=' +
        'Tek_deg_gruppa,Bold.DelphiName=Tek_deg_gruppa"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1088' '#1089#1084#1077#1085#1099' '#1076#1077#1078' '#1075#1088#1091#1087#1087'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D86190109,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Vr_smeny_deg_grupp,Bold.ExpressionN' +
        'ame=Vr_smeny_deg_grupp,Bold.DelphiName=Vr_smeny_deg_grupp"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1090#1082#1080' '#1076#1077#1078' '#1075#1088#1091#1087#1087#1099'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D864D033C,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Sutki_deg_grupp' +
        'y,Bold.ExpressionName=Sutki_deg_gruppy,Bold.DelphiName=Sutki_deg' +
        '_gruppy"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1077#1088' '#1086#1073#1085#1086#1074#1083' '#1076#1077#1078'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D871901D4,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Per_obnovl_deg,Bold.ExpressionName=' +
        'Per_obnovl_deg,Bold.DelphiName=Per_obnovl_deg"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1077#1088' '#1086#1073#1085#1086#1074#1083' '#1086#1073#1099#1095#1085' '#1074#1086#1076'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=445D873401D4,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Per_obnovl_obychn_vod,Bold.Expressi' +
        'onName=Per_obnovl_obychn_vod,Bold.DelphiName=Per_obnovl_obychn_v' +
        'od"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1084#1077#1085' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447067F1036B,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Namen_organizacii,Bold.ExpressionNa' +
        'me=Namen_organizacii,Bold.DelphiName=Namen_organizacii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1091#1090#1077#1074' '#1083#1080#1089#1090' '#1089#1077#1088#1080#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4470681801A5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Putev_list_seriya,Bold.ExpressionNa' +
        'me=Putev_list_seriya,Bold.DelphiName=Putev_list_seriya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084' '#1087#1091#1090#1077#1074#1086#1075#1086' '#1083#1080#1089#1090#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"1"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4470683D0109,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nom_putevogo_lista,Bold.ExpressionN' +
        'ame=Nom_putevogo_lista,Bold.DelphiName=Nom_putevogo_lista"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1083#1080#1095' '#1074#1099#1076' '#1073#1077#1085#1079#1080#1085#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447068860399,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kolich_vyd_benzina,Bold.ExpressionN' +
        'ame=Kolich_vyd_benzina,Bold.DelphiName=Kolich_vyd_benzina"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' 1"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447068AB00CB,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Napravlenie_1,Bold.ExpressionName=N' +
        'apravlenie_1,Bold.DelphiName=Napravlenie_1"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' 2"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447068C30177,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Napravlenie_2,Bold.ExpressionName=N' +
        'apravlenie_2,Bold.DelphiName=Napravlenie_2"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' 3"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447068D202DE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Napravlenie_3,Bold.ExpressionName=N' +
        'apravlenie_3,Bold.DelphiName=Napravlenie_3"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1084#1084#1077#1085#1090' '#1082' '#1088#1072#1073#1086#1090#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447068E900DA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Komment_k_rabote,Bold.ExpressionNam' +
        'e=Komment_k_rabote,Bold.DelphiName=Komment_k_rabote"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenStartSet"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447D9DFE0290,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenStartSet' +
        ',Bold.ExpressionName=BetweenStartSet,Bold.DelphiName=BetweenStar' +
        'tSet"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenSetOn"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447D9E54033C,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenSetOn,Bo' +
        'ld.ExpressionName=BetweenSetOn,Bold.DelphiName=BetweenSetOn"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenOnEnd"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=447D9EB90251,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenOnEnd,Bo' +
        'ld.ExpressionName=BetweenOnEnd,Bold.DelphiName=BetweenOnEnd"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenStartSetColor"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44745B7B02FD,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenStartSet' +
        'Color,Bold.ExpressionName=BetweenStartSetColor,Bold.DelphiName=B' +
        'etweenStartSetColor"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenSetOnColor"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44745B7B036B,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenSetOnCol' +
        'or,Bold.ExpressionName=BetweenSetOnColor,Bold.DelphiName=Between' +
        'SetOnColor"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenOnEndColor"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44745B7B03D8,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenOnEndCol' +
        'or,Bold.ExpressionName=BetweenOnEndColor,Bold.DelphiName=Between' +
        'OnEndColor"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenSetEnd"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=41D5938700BB,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenSetEnd,B' +
        'old.ExpressionName=BetweenSetEnd,Bold.DelphiName=BetweenSetEnd"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"BetweenSetEndColor"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=41D593B90148,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=BetweenSetEndCo' +
        'lor,Bold.ExpressionName=BetweenSetEndColor,Bold.DelphiName=Betwe' +
        'enSetEndColor"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"ViewSetEndLong"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=41D593CB0242,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=ViewSetEndLong,Bold.ExpressionName=' +
        'ViewSetEndLong,Bold.DelphiName=ViewSetEndLong"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1086#1073#1097#1077#1087#1088#1080#1079' '#1095#1080#1089#1083#1086'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44BA0B5600BB,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=obshepriz_chislo,Bold.ExpressionNam' +
        'e=obshepriz_chislo,Bold.DelphiName=obshepriz_chislo"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1086#1073#1097#1077#1087#1088#1080#1079' '#1089#1095#1105#1090#1095#1080#1082'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"0"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44BA0B7A02EE,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=obshepriz_schyotchik,Bold.Expressio' +
        'nName=obshepriz_schyotchik,Bold.DelphiName=obshepriz_schyotchik"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1094#1074#1077#1090' '#1086#1073#1096#1077#1087#1088#1080#1079'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44BA0BFA038A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=cvet_obshepriz,Bold.ExpressionName=' +
        'cvet_obshepriz,Bold.DelphiName=cvet_obshepriz"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1094#1074#1077#1090' '#1089#1086' '#1089#1082#1080#1076#1082#1086#1081'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'"16777215"'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44BA0C9E037A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=cvet_so_skidkoi,Bold.ExpressionName' +
        '=cvet_so_skidkoi,Bold.DelphiName=cvet_so_skidkoi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1089#1080#1084#1074' '#1072#1074#1090#1086#1084' '#1091#1089#1090#1072#1085'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FC0166038A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=simv_avtom_ustan,Bold.ExpressionNam' +
        'e=simv_avtom_ustan,Bold.DelphiName=simv_avtom_ustan"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1089#1095#1080#1090' '#1086#1082#1086#1085' '#1087#1086#1089#1083' '#1082#1086#1085' '#1089#1077#1082#1090'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD7356009C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=schit_okon_posl_kon_sekt,Bold.Expre' +
        'ssionName=schit_okon_posl_kon_sekt,Bold.DelphiName=schit_okon_po' +
        'sl_kon_sekt"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1074#1088' '#1089#1084#1077#1085#1099' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1086#1074'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=456EA3C60251,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=vr_smeny_dispetcherov,Bold.Expressi' +
        'onName=vr_smeny_dispetcherov,Bold.DelphiName=vr_smeny_dispetcher' +
        'ov"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1055#1083#1086#1093#1080#1077' '#1082#1083#1080#1077#1085#1090#1099'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44171BA200EA,persistence=persistent,Bol' +
        'd.DelphiName=TPlohie_klienty,Bold.ExpressionName=Plohie_klienty,' +
        'Bold.TableName=Plohie_klienty,Bold.InterfaceName=IPlohie_klienty' +
        '"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1058#1077#1083#1077#1092#1086#1085' '#1082#1083#1080#1077#1085#1090#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44171C0901A5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Telefon_klienta,Bold.ExpressionName' +
        '=Telefon_klienta,Bold.DelphiName=Telefon_klienta"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1086#1079#1099#1074#1085#1086#1081'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44171C0901C5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Pozyvnoi,Bold.ExpressionName=Pozyvn' +
        'oi,Bold.DelphiName=Pozyvnoi"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1072#1095#1072#1083#1086'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44171C0901E4,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nachalo,Bold.ExpressionName=Nachalo' +
        ',Bold.DelphiName=Nachalo"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1076#1088#1077#1089' '#1074#1099#1079#1086#1074#1072' '#1074#1074#1086#1076#1080#1084'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44171C090203,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Adres_vyzova_vvodim,Bold.Expression' +
        'Name=Adres_vyzova_vvodim,Bold.DelphiName=Adres_vyzova_vvodim"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1057#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=4429578C02EE,persistence=persistent,Bol' +
        'd.DelphiName=TSektor_raboty,Bold.ExpressionName=Sektor_raboty,Bo' +
        'ld.TableName=Sektor_raboty,Bold.InterfaceName=ISektor_raboty"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442957A3008C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Nomer_sektora,Bold.ExpressionName=N' +
        'omer_sektora,Bold.DelphiName=Nomer_sektora"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1073#1083#1072#1089#1090#1100' '#1089#1074#1077#1088#1093#1091'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442DB670029F,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Oblastj_sverhu,Bold.ExpressionName=' +
        'Oblastj_sverhu,Bold.DelphiName=Oblastj_sverhu"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1073#1083#1072#1089#1090#1100' '#1089#1083#1077#1074#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442DB6B40222,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Oblastj_sleva,Bold.ExpressionName=O' +
        'blastj_sleva,Bold.DelphiName=Oblastj_sleva"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1064#1080#1088#1080#1085#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442DB6F903A9,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Shirina,Bold.ExpressionName=Shirina' +
        ',Bold.DelphiName=Shirina"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1099#1089#1086#1090#1072'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442DB73C00FA,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Vysota,Bold.ExpressionName=Vysota,B' +
        'old.DelphiName=Vysota"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1085#1072' '#1089#1077#1082#1090#1086#1088#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442DB772036B,persistence=persistent,d' +
        'erived=False,Bold.Length=1000,Bold.ColumnName=Podskazka_na_sekto' +
        're,Bold.ExpressionName=Podskazka_na_sektore,Bold.DelphiName=Pods' +
        'kazka_na_sektore"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1076' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442DBBC1033C,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kod_sektora,Bold.ExpressionName=Kod' +
        '_sektora,Bold.DelphiName=Kod_sektora"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44295BAE006D,persistence=persistent,Bol' +
        'd.DelphiName=TSootvetstvie_parametrov_zakaza,Bold.ExpressionName' +
        '=Sootvetstvie_parametrov_zakaza,Bold.TableName=Sootvetstvie_para' +
        'metrov_zakaza,Bold.InterfaceName=ISootvetstvie_parametrov_zakaza' +
        '"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1053#1086#1084#1077#1088' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44295C250119,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Nomer_sektora,Bold.ExpressionName=Nom' +
        'er_sektora,Bold.DelphiName=Nomer_sektora,Bold.DerivationOCL=otno' +
        'sitsya_k_sektoru.nomer_sektora"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1058#1077#1083#1077#1092#1086#1085' '#1082#1083#1080#1077#1085#1090#1072'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44295C4A0196,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Telefon_klienta,Bold.ExpressionName' +
        '=Telefon_klienta,Bold.DelphiName=Telefon_klienta"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1040#1076#1088#1077#1089' '#1074#1099#1079#1086#1074#1072' '#1074#1074#1086#1076#1080#1084'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44295C4A01C5,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Adres_vyzova_vvodim,Bold.Expression' +
        'Name=Adres_vyzova_vvodim,Bold.DelphiName=Adres_vyzova_vvodim"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1084#1084#1072#1088#1085' '#1095#1080#1089#1083#1086' '#1074#1099#1079#1086#1074#1086#1074'"'
      #9#9#9#9#9'"Integer"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=444A5950006D,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Summarn_chislo_vyzovov,Bold.Express' +
        'ionName=Summarn_chislo_vyzovov,Bold.DelphiName=Summarn_chislo_vy' +
        'zovov"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1041#1072#1083#1072#1085#1089'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44FD71AE0290,persistence=persistent,Bol' +
        'd.DelphiName=TBalans,Bold.ExpressionName=Balans,Bold.TableName=B' +
        'alans,Bold.InterfaceName=IBalans"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1041#1072#1083#1072#1085#1089'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD72DB007D,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Balans,Bold.ExpressionName=Balans,Bol' +
        'd.DelphiName=Balans,\"Bold.DerivationOCL=imeet_prihody->collect(' +
        'summa_pozicii)->sum-\c\limeet_rashody->collect(summa_pozicii)->s' +
        'um\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1041#1072#1083#1072#1085#1089' '#1085#1072' '#1076#1072#1090#1091'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD72E6008C,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Balans_na_datu,Bold.ExpressionName=Ba' +
        'lans_na_datu,Bold.DelphiName=Balans_na_datu,\"Bold.DerivationOCL' +
        '=imeet_prihody->select(data_prihoda<=self.data_vych_balansa)->co' +
        'llect(summa_pozicii)->sum-\c\l\c\limeet_rashody->select(data_ras' +
        'hoda<=self.data_vych_balansa)->collect(summa_pozicii)->sum\""'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1074#1099#1095' '#1073#1072#1083#1072#1085#1089#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD72FC034B,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data_vych_balan' +
        'sa,Bold.ExpressionName=Data_vych_balansa,Bold.DelphiName=Data_vy' +
        'ch_balansa"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1054#1087#1077#1088#1072#1094#1080#1103'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44FD71C40232,persistence=persistent,Bol' +
        'd.DelphiName=TOperaciya,Bold.ExpressionName=Operaciya,Bold.Table' +
        'Name=Operaciya,Bold.InterfaceName=IOperaciya"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1077#1073#1077#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD71CE0177,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Debet,Bold.ExpressionName=Debet,Bol' +
        'd.DelphiName=Debet"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1088#1077#1076#1080#1090'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD71D502FD,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kredit,Bold.ExpressionName=Kredit,B' +
        'old.DelphiName=Kredit"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1089#1085#1086#1074#1072#1085#1080#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD71E8037A,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Osnovanie,Bold.ExpressionName=Osnov' +
        'anie,Bold.DelphiName=Osnovanie"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1090#1072#1090#1100#1103'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD71ED01F4,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Statjya,Bold.ExpressionName=Statjya' +
        ',Bold.DelphiName=Statjya"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD7224005D,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Kommentarii,Bold.ExpressionName=Kom' +
        'mentarii,Bold.DelphiName=Kommentarii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1084#1084#1072' '#1086#1087#1077#1088#1072#1094#1080#1080'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD72AD0251,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Summa_operacii,Bold.ExpressionName=' +
        'Summa_operacii,Bold.DelphiName=Summa_operacii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD72B1030D,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data,Bold.Expre' +
        'ssionName=Data,Bold.DelphiName=Data"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1056#1072#1089#1093#1086#1076'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44FD721E00CB,persistence=persistent,Bol' +
        'd.DelphiName=TRashod,Bold.ExpressionName=Rashod,Bold.TableName=R' +
        'ashod,Bold.InterfaceName=IRashod"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1091#1084#1084#1072' '#1087#1086#1079#1080#1094#1080#1080'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFEFCC0177,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Summa_pozicii,Bold.ExpressionName=S' +
        'umma_pozicii,Bold.DelphiName=Summa_pozicii"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072' '#1088#1072#1089#1093#1086#1076#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFE075000F,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data_rashoda,Bo' +
        'ld.ExpressionName=Data_rashoda,Bold.DelphiName=Data_rashoda"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1054#1087#1080#1089#1072#1085#1080#1077'"'
      #9#9#9#9#9'"String"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFE0A5004E,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Opisanie,Bold.ExpressionName=Opisan' +
        'ie,Bold.DelphiName=Opisanie"'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1042#1093#1086#1076#1099' '#1087#1086#1083#1100#1079'"'
      #9#9#9'"BusinessClassesRoot"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=44FFB950038A,persistence=persistent,Bol' +
        'd.DelphiName=TVhody_poljz,Bold.ExpressionName=Vhody_poljz,Bold.T' +
        'ableName=Vhody_poljz,Bold.InterfaceName=IVhody_poljz"'
      #9#9#9'(Attributes'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1044#1072#1090#1072'"'
      #9#9#9#9#9'"DateTime"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFB99D0203,persistence=persistent,d' +
        'erived=False,Bold.AllowNULL=True,Bold.ColumnName=Data,Bold.Expre' +
        'ssionName=Data,Bold.DelphiName=Data"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1093#1086#1076'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFB9B402BF,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Vhod,Bold.ExpressionName=Vhod,Bold.' +
        'DelphiName=Vhod"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042#1099#1093#1086#1076'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFB9C600CB,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=Vyhod,Bold.ExpressionName=Vyhod,Bol' +
        'd.DelphiName=Vyhod"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042' '#1088#1086#1083#1080' '#1086#1087#1077#1088#1072#1090#1086#1088#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFB9D50203,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=V_roli_operatora,Bold.ExpressionNam' +
        'e=V_roli_operatora,Bold.DelphiName=V_roli_operatora"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1042' '#1088#1086#1083#1080' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072'"'
      #9#9#9#9#9'"Boolean"'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFB9EE0128,persistence=persistent,d' +
        'erived=False,Bold.ColumnName=V_roli_dispetchera,Bold.ExpressionN' +
        'ame=V_roli_dispetchera,Bold.DelphiName=V_roli_dispetchera"'
      #9#9#9#9')'
      #9#9#9#9'(Attribute'
      #9#9#9#9#9'"'#1057#1082#1086#1083#1100#1082#1086' '#1095#1072#1089#1086#1074'"'
      #9#9#9#9#9'"Double"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'""'
      #9#9#9#9#9'""'
      #9#9#9#9#9'2'
      #9#9#9#9#9'""'
      
        #9#9#9#9#9'"_BoldInternal.toolId=456038E201C5,persistence=transient,de' +
        'rived=True,Bold.ColumnName=Skoljko_chasov,Bold.ExpressionName=Sk' +
        'oljko_chasov,Bold.DelphiName=Skoljko_chasov,\"Bold.DerivationOCL' +
        '=if (yavl_vhodom_poljz.imeet_vhody->select(vyhod)\c\l->select(da' +
        'ta>self.data)->size>0) and vhod then\c\l(yavl_vhodom_poljz.imeet' +
        '_vhody->select(vyhod)\c\l->select(data>self.data)->orderby(data)' +
        '->first.data.datetimeasfloat\c\l-self.data.datetimeasfloat)/((#2' +
        '000-01-02.dateTimeAsFloat-#2000-01-01.dateTimeAsFloat)/24.0)\c\l' +
        'else 0.0 endif\""'
      #9#9#9#9')'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9#9'(Class'
      #9#9#9'"'#1043#1088#1091#1087#1087#1072' '#1074#1086#1076#1080#1090#1077#1083#1077#1081'"'
      #9#9#9'"'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082'"'
      #9#9#9'TRUE'
      #9#9#9'FALSE'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"_BoldInternal.toolId=45519A310251,persistence=persistent,Bol' +
        'd.DelphiName=TGruppa_voditelei,Bold.ExpressionName=Gruppa_vodite' +
        'lei,Bold.TableName=Gruppa_voditelei,Bold.InterfaceName=IGruppa_v' +
        'oditelei"'
      #9#9#9'(Attributes'
      #9#9#9')'
      #9#9#9'(Methods'
      #9#9#9')'
      #9#9')'
      #9')'
      #9'(Associations'
      #9#9'(Association'
      #9#9#9'"'#1086#1090' '#1076#1077#1081#1089#1090#1074#1080#1081#1076#1077#1081#1089#1090#1074#1080#1103' '#1092#1080#1082#1089#1080#1088#1091#1102#1090#1089#1103' '#1074'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=43E3DE830146,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkot_deistviideistviya_fiksiruyutsya_v"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090' '#1076#1077#1081#1089#1090#1074#1080#1081'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1051#1086#1075' '#1086#1087#1077#1088#1072#1094#1080#1080'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DE840137,Bold.ColumnName=ot_deist' +
        'vii,Bold.ExpressionName=ot_deistvii,Bold.DelphiName=ot_deistvii"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1076#1077#1081#1089#1090#1074#1080#1103' '#1092#1080#1082#1089#1080#1088#1091#1102#1090#1089#1103' '#1074'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1055#1077#1088#1089#1086#1085#1072#1083'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=43E3DE840139,Bold.ColumnName=deistviy' +
        'a_fiksiruyutsya_v,Bold.ExpressionName=deistviya_fiksiruyutsya_v,' +
        'Bold.DelphiName=deistviya_fiksiruyutsya_v,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1099#1079#1086#1074#1086#1084' '#1085#1072' '#1091#1083#1080#1094#1091#1091#1083#1080#1094#1072' '#1074#1099#1079#1086#1074#1072' '#1076#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032BB90127,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkyavlyaetsya_vyzovom_na_ulicuulica_vyzova_dlya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1103#1074#1083#1103#1077#1090#1089#1103' '#1074#1099#1079#1086#1074#1086#1084' '#1085#1072' '#1091#1083#1080#1094#1091'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1064#1072#1073#1083#1086#1085' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BBA006C,Bold.ColumnName=yavlyaet' +
        'sya_vyzovom_na_ulicu,Bold.ExpressionName=yavlyaetsya_vyzovom_na_' +
        'ulicu,Bold.DelphiName=yavlyaetsya_vyzovom_na_ulicu"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1091#1083#1080#1094#1072' '#1074#1099#1079#1086#1074#1072' '#1076#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1059#1083#1080#1094#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BBA007C,Bold.ColumnName=ulica_vy' +
        'zova_dlya,Bold.ExpressionName=ulica_vyzova_dlya,Bold.DelphiName=' +
        'ulica_vyzova_dlya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1103#1074#1083' '#1074#1099#1079#1086#1074#1086#1084' '#1085#1072' '#1088#1072#1081#1086#1085#1088#1072#1081#1086#1085' '#1074#1099#1079#1086#1074#1072' '#1076#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032BBD002D,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkyavl_vyzovom_na_raionraion_vyzova_dlya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1103#1074#1083' '#1074#1099#1079#1086#1074#1086#1084' '#1085#1072' '#1088#1072#1081#1086#1085'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1064#1072#1073#1083#1086#1085' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BBD031B,Bold.ColumnName=yavl_vyz' +
        'ovom_na_raion,Bold.ExpressionName=yavl_vyzovom_na_raion,Bold.Del' +
        'phiName=yavl_vyzovom_na_raion"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1088#1072#1081#1086#1085' '#1074#1099#1079#1086#1074#1072' '#1076#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1056#1072#1081#1086#1085'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BBD031D,Bold.ColumnName=raion_vy' +
        'zova_dlya,Bold.ExpressionName=raion_vyzova_dlya,Bold.DelphiName=' +
        'raion_vyzova_dlya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1103#1074#1083' '#1074#1099#1079#1086#1074#1086#1084' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1086#1073#1098#1077#1082#1090' '#1074#1099#1079#1086#1074#1072' '#1076#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032BBF032B,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkyavl_vyzovom_na_objektobjekt_vyzova_dlya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1103#1074#1083' '#1074#1099#1079#1086#1074#1086#1084' '#1085#1072' '#1086#1073#1098#1077#1082#1090'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1064#1072#1073#1083#1086#1085' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BC00202,Bold.ColumnName=yavl_vyz' +
        'ovom_na_objekt,Bold.ExpressionName=yavl_vyzovom_na_objekt,Bold.D' +
        'elphiName=yavl_vyzovom_na_objekt"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1073#1098#1077#1082#1090' '#1074#1099#1079#1086#1074#1072' '#1076#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1054#1073#1098#1077#1082#1090'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BC00212,Bold.ColumnName=objekt_v' +
        'yzova_dlya,Bold.ExpressionName=objekt_vyzova_dlya,Bold.DelphiNam' +
        'e=objekt_vyzova_dlya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1079#1072#1074#1080#1089#1080#1090' '#1086#1090' '#1088#1072#1081#1086#1085#1072#1087#1088#1077#1076#1087#1086#1083#1072#1075#1072#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1100'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032BC7028F,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkzavisit_ot_raionapredpolagaet_stoimostj"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1079#1072#1074#1080#1089#1080#1090' '#1086#1090' '#1088#1072#1081#1086#1085#1072'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1090#1086#1080#1084#1086#1089#1090#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BC80156,_Boldify.defaultMultipli' +
        'city=True,Bold.ColumnName=zavisit_ot_raiona,Bold.ExpressionName=' +
        'zavisit_ot_raiona,Bold.DelphiName=zavisit_ot_raiona"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1087#1088#1077#1076#1087#1086#1083#1072#1075#1072#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1100'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1056#1072#1081#1086#1085'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BC80166,_Boldify.defaultMultipli' +
        'city=True,Bold.ColumnName=predpolagaet_stoimostj,Bold.Expression' +
        'Name=predpolagaet_stoimostj,Bold.DelphiName=predpolagaet_stoimos' +
        'tj"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1074#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1074#1086#1076#1080#1090#1077#1083#1077#1084#1074#1099#1087#1086#1083#1085#1103#1077#1090' '#1079#1072#1082#1072#1079#1099'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032BE90231,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkvypolnyaetsya_voditelemvypolnyaet_zakazy"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1074#1099#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1074#1086#1076#1080#1090#1077#1083#1077#1084'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BEA004D,Bold.ColumnName=vypolnya' +
        'etsya_voditelem,Bold.ExpressionName=vypolnyaetsya_voditelem,Bold' +
        '.DelphiName=vypolnyaetsya_voditelem"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1074#1099#1087#1086#1083#1085#1103#1077#1090' '#1079#1072#1082#1072#1079#1099'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BEA004F,Bold.ColumnName=vypolnya' +
        'et_zakazy,Bold.ExpressionName=vypolnyaet_zakazy,Bold.DelphiName=' +
        'vypolnyaet_zakazy,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1091#1087#1088#1072#1074#1083#1103#1077#1090#1089#1103' '#1074#1086#1076#1080#1090#1077#1083#1077#1084#1088#1072#1073#1086#1090#1072#1077#1090' '#1085#1072'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032BF7035A,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkupravlyaetsya_voditelemrabotaet_na"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1091#1087#1088#1072#1074#1083#1103#1077#1090#1089#1103' '#1074#1086#1076#1080#1090#1077#1083#1077#1084'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1052#1072#1096#1080#1085#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BF801D3,Bold.ColumnName=upravlya' +
        'etsya_voditelem,Bold.ExpressionName=upravlyaetsya_voditelem,Bold' +
        '.DelphiName=upravlyaetsya_voditelem"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1088#1072#1073#1086#1090#1072#1077#1090' '#1085#1072'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032BF801D5,Bold.ColumnName=rabotaet' +
        '_na,Bold.ExpressionName=rabotaet_na,Bold.DelphiName=rabotaet_na"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1090#1087#1091#1089#1082#1072#1077#1090#1089#1103' '#1076#1086#1089#1090#1077#1087#1095#1077#1088#1086#1084#1087#1077#1088#1077#1095#1077#1085#1100' '#1079#1072#1082#1072#1079#1086#1074'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032C24003D,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkotpuskaetsya_dostepcheromperechenj_zakazov"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1087#1091#1089#1082#1072#1077#1090#1089#1103' '#1076#1086#1089#1090#1077#1087#1095#1077#1088#1086#1084'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032C290231,Bold.ColumnName=otpuskae' +
        'tsya_dostepcherom,Bold.ExpressionName=otpuskaetsya_dostepcherom,' +
        'Bold.DelphiName=otpuskaetsya_dostepcherom"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1087#1077#1088#1077#1095#1077#1085#1100' '#1079#1072#1082#1072#1079#1086#1074'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1055#1077#1088#1089#1086#1085#1072#1083'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032C290233,Bold.ColumnName=perechen' +
        'j_zakazov,Bold.ExpressionName=perechenj_zakazov,Bold.DelphiName=' +
        'perechenj_zakazov,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1094#1077#1085#1080#1074#1072#1077#1090#1089#1103' '#1095#1077#1088#1077#1079#1089#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1076#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44032C3802BE,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkocenivaetsya_cherezsostavlyaet_stoimostj_dlya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1094#1077#1085#1080#1074#1072#1077#1090#1089#1103' '#1095#1077#1088#1077#1079'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032C390118,Bold.ColumnName=ocenivae' +
        'tsya_cherez,Bold.ExpressionName=ocenivaetsya_cherez,Bold.DelphiN' +
        'ame=ocenivaetsya_cherez"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1089#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1076#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1090#1086#1080#1084#1086#1089#1090#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44032C39011A,Bold.ColumnName=sostavly' +
        'aet_stoimostj_dlya,Bold.ExpressionName=sostavlyaet_stoimostj_dly' +
        'a,Bold.DelphiName=sostavlyaet_stoimostj_dlya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1082#1077#1084' '#1087#1088#1080#1085#1086#1089#1080#1090#1089#1103#1087#1088#1080#1085#1086#1089#1080#1090' '#1076#1086#1093#1086#1076'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=4405650501B4,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkkem_prinositsyaprinosit_dohod"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1082#1077#1084' '#1087#1088#1080#1085#1086#1089#1080#1090#1089#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1099#1088#1091#1095#1082#1072' '#1086#1090' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405650600D9,Bold.ColumnName=kem_prin' +
        'ositsya,Bold.ExpressionName=kem_prinositsya,Bold.DelphiName=kem_' +
        'prinositsya"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1087#1088#1080#1085#1086#1089#1080#1090' '#1076#1086#1093#1086#1076'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405650600E9,Bold.ColumnName=prinosit' +
        '_dohod,Bold.ExpressionName=prinosit_dohod,Bold.DelphiName=prinos' +
        'it_dohod,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1095#1077#1084' '#1091#1095#1080#1090#1099#1074#1072#1077#1090#1089#1103' '#1074#1086#1076#1080#1090#1077#1083#1100#1091#1095#1080#1090#1099#1074#1072#1077#1090' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=4405666901D3,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkchem_uchityvaetsya_voditeljuchityvaet_voditelya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1095#1077#1084' '#1091#1095#1080#1090#1099#1074#1072#1077#1090#1089#1103' '#1074#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405666A0231,Bold.ColumnName=chem_uch' +
        'ityvaetsya_voditelj,Bold.ExpressionName=chem_uchityvaetsya_vodit' +
        'elj,Bold.DelphiName=chem_uchityvaetsya_voditelj"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1091#1095#1080#1090#1099#1074#1072#1077#1090' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1054#1073#1098#1077#1082#1090' '#1074#1099#1073#1086#1088#1082#1080' '#1086#1090#1095#1105#1090#1085#1086#1089#1090#1080'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405666A0233,Bold.ColumnName=uchityva' +
        'et_voditelya,Bold.ExpressionName=uchityvaet_voditelya,Bold.Delph' +
        'iName=uchityvaet_voditelya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1095#1077#1084' '#1091#1095#1080#1090#1099#1074#1072#1077#1090#1089#1103' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1091#1095#1080#1090#1099#1074#1077#1090' '#1088#1072#1073#1086#1090#1091'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=4405666E034A,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkchem_uchityvaetsya_dispetcheruchityvet_rabotu"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1095#1077#1084' '#1091#1095#1080#1090#1099#1074#1072#1077#1090#1089#1103' '#1076#1080#1089#1087#1077#1090#1095#1077#1088'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1055#1077#1088#1089#1086#1085#1072#1083'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405667000BA,Bold.ColumnName=chem_uch' +
        'ityvaetsya_dispetcher,Bold.ExpressionName=chem_uchityvaetsya_dis' +
        'petcher,Bold.DelphiName=chem_uchityvaetsya_dispetcher"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1091#1095#1080#1090#1099#1074#1077#1090' '#1088#1072#1073#1086#1090#1091'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1054#1073#1098#1077#1082#1090' '#1074#1099#1073#1086#1088#1082#1080' '#1086#1090#1095#1105#1090#1085#1086#1089#1090#1080'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4405667000BC,Bold.ColumnName=uchityve' +
        't_rabotu,Bold.ExpressionName=uchityvet_rabotu,Bold.DelphiName=uc' +
        'hityvet_rabotu,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1080#1084#1077#1077#1090' '#1087#1077#1088#1074#1091#1102' '#1091#1083#1080#1094#1091' '#1091#1075#1083#1072#1086#1073#1088#1072#1079#1091#1077#1090' '#1082#1072#1082' '#1087#1077#1088#1091#1074#1072#1103' '#1091#1083#1080#1094#1072' '#1091#1075#1086#1083'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=440BCB63005C,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkimeet_pervuyu_ulicu_uglaobrazuet_kak_peruvaya_ulic' +
        'a_ugol"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1080#1084#1077#1077#1090' '#1087#1077#1088#1074#1091#1102' '#1091#1083#1080#1094#1091' '#1091#1075#1083#1072'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1064#1072#1073#1083#1086#1085' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440BCB640241,Bold.ColumnName=imeet_pe' +
        'rvuyu_ulicu_ugla,Bold.ExpressionName=imeet_pervuyu_ulicu_ugla,Bo' +
        'ld.DelphiName=imeet_pervuyu_ulicu_ugla"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1073#1088#1072#1079#1091#1077#1090' '#1082#1072#1082' '#1087#1077#1088#1091#1074#1072#1103' '#1091#1083#1080#1094#1072' '#1091#1075#1086#1083'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1059#1083#1080#1094#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440BCB640250,Bold.ColumnName=obrazuet' +
        '_kak_peruvaya_ulica_ugol,Bold.ExpressionName=obrazuet_kak_peruva' +
        'ya_ulica_ugol,Bold.DelphiName=obrazuet_kak_peruvaya_ulica_ugol,B' +
        'old.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1080#1084#1077#1077#1090' '#1074#1090#1086#1088#1091#1102' '#1091#1083#1080#1094#1091' '#1091#1075#1083#1072#1086#1073#1088#1072#1079#1091#1077#1090' '#1082#1072#1082' '#1074#1090#1086#1088#1072#1103' '#1091#1075#1086#1083'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=440BCB66027F,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkimeet_vtoruyu_ulicu_uglaobrazuet_kak_vtoraya_ugol"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1080#1084#1077#1077#1090' '#1074#1090#1086#1088#1091#1102' '#1091#1083#1080#1094#1091' '#1091#1075#1083#1072'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1064#1072#1073#1083#1086#1085' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440BCB67007C,Bold.ColumnName=imeet_vt' +
        'oruyu_ulicu_ugla,Bold.ExpressionName=imeet_vtoruyu_ulicu_ugla,Bo' +
        'ld.DelphiName=imeet_vtoruyu_ulicu_ugla"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1073#1088#1072#1079#1091#1077#1090' '#1082#1072#1082' '#1074#1090#1086#1088#1072#1103' '#1091#1075#1086#1083'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1059#1083#1080#1094#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=440BCB67008B,Bold.ColumnName=obrazuet' +
        '_kak_vtoraya_ugol,Bold.ExpressionName=obrazuet_kak_vtoraya_ugol,' +
        'Bold.DelphiName=obrazuet_kak_vtoraya_ugol,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1089#1077#1082#1090#1086#1088#1091#1074#1082#1083#1102#1095#1072#1077#1090' '#1088#1072#1081#1086#1085'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=442957E9029F,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkotnositsya_k_sektoruvklyuchaet_raion"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1089#1077#1082#1090#1086#1088#1091'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1056#1072#1081#1086#1085'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442957EA038A,Bold.ColumnName=otnosits' +
        'ya_k_sektoru,Bold.ExpressionName=otnositsya_k_sektoru,Bold.Delph' +
        'iName=otnositsya_k_sektoru"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1074#1082#1083#1102#1095#1072#1077#1090' '#1088#1072#1081#1086#1085'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442957EA0399,Bold.ColumnName=vklyucha' +
        'et_raion,Bold.ExpressionName=vklyuchaet_raion,Bold.DelphiName=vk' +
        'lyuchaet_raion,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1072#1076#1088#1077#1089' '#1089#1077#1082#1090#1086#1088#1072#1074#1082#1083#1102#1095#1072#1077#1090' '#1072#1076#1088#1077#1089#1072'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=4429582E004E,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkadres_sektoravklyuchaet_adresa"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1072#1076#1088#1077#1089' '#1089#1077#1082#1090#1086#1088#1072'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4429582F00AB,Bold.ColumnName=adres_se' +
        'ktora,Bold.ExpressionName=adres_sektora,Bold.DelphiName=adres_se' +
        'ktora"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1074#1082#1083#1102#1095#1072#1077#1090' '#1072#1076#1088#1077#1089#1072'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4429582F00AD,Bold.ColumnName=vklyucha' +
        'et_adresa,Bold.ExpressionName=vklyuchaet_adresa,Bold.DelphiName=' +
        'vklyuchaet_adresa,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1088#1072#1073#1086#1090#1072#1077#1090' '#1085#1072' '#1089#1077#1082#1090#1086#1088#1077#1103#1074#1083' '#1089#1077#1082#1090' '#1088#1072#1073#1086#1090#1099' '#1076#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44295893031C,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkrabotaet_na_sektoreyavl_sekt_raboty_dlya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1088#1072#1073#1086#1090#1072#1077#1090' '#1085#1072' '#1089#1077#1082#1090#1086#1088#1077'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4429589501A5,Bold.ColumnName=rabotaet' +
        '_na_sektore,Bold.ExpressionName=rabotaet_na_sektore,Bold.DelphiN' +
        'ame=rabotaet_na_sektore"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1103#1074#1083' '#1089#1077#1082#1090' '#1088#1072#1073#1086#1090#1099' '#1076#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4429589501A7,Bold.ColumnName=yavl_sek' +
        't_raboty_dlya,Bold.ExpressionName=yavl_sekt_raboty_dlya,Bold.Del' +
        'phiName=yavl_sekt_raboty_dlya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1082#1086#1085#1077#1095#1085#1099#1081' '#1089#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099#1103#1074#1083' '#1082#1086#1085#1077#1095#1085' '#1089#1077#1082#1090#1086#1088#1086#1084' '#1076#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=442A478200FA,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkkonechnyi_sektor_rabotyyavl_konechn_sektorom_dlya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1082#1086#1085#1077#1095#1085#1099#1081' '#1089#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442A47830399,Bold.ColumnName=konechny' +
        'i_sektor_raboty,Bold.ExpressionName=konechnyi_sektor_raboty,Bold' +
        '.DelphiName=konechnyi_sektor_raboty"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1103#1074#1083' '#1082#1086#1085#1077#1095#1085' '#1089#1077#1082#1090#1086#1088#1086#1084' '#1076#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442A4783039B,Bold.ColumnName=yavl_kon' +
        'echn_sektorom_dlya,Bold.ExpressionName=yavl_konechn_sektorom_dly' +
        'a,Bold.DelphiName=yavl_konechn_sektorom_dlya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1089#1077#1082#1090#1086#1088#1091#1093#1072#1088#1072#1082#1090' '#1072#1089#1089#1086#1094#1080#1072#1094#1080#1080'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=442A500E0196,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkotnositsya_k_sektoruharakt_associacii"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1089#1077#1082#1090#1086#1088#1091'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1079#1072#1082#1072#1079#1072'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442A501502AF,Bold.ColumnName=otnosits' +
        'ya_k_sektoru,Bold.ExpressionName=otnositsya_k_sektoru,Bold.Delph' +
        'iName=otnositsya_k_sektoru"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1093#1072#1088#1072#1082#1090' '#1072#1089#1089#1086#1094#1080#1072#1094#1080#1080'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=442A5015030D,Bold.ColumnName=harakt_a' +
        'ssociacii,Bold.ExpressionName=harakt_associacii,Bold.DelphiName=' +
        'harakt_associacii,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1089#1077#1082#1090#1086#1088' '#1074#1086#1076#1080#1090#1077#1083#1103#1074#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1089#1077#1082#1090' '#1076#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=4432936C0251,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linksektor_voditelyavoditeljskii_sekt_dlya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1089#1077#1082#1090#1086#1088' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4432936E0242,Bold.ColumnName=sektor_v' +
        'oditelya,Bold.ExpressionName=sektor_voditelya,Bold.DelphiName=se' +
        'ktor_voditelya"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1074#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1081' '#1089#1077#1082#1090' '#1076#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1057#1077#1082#1090#1086#1088' '#1088#1072#1073#1086#1090#1099'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=4432936E0261,Bold.ColumnName=voditelj' +
        'skii_sekt_dlya,Bold.ExpressionName=voditeljskii_sekt_dlya,Bold.D' +
        'elphiName=voditeljskii_sekt_dlya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1090#1087#1088#1072#1074#1083#1103#1077#1090#1089#1103#1086#1090#1087#1088#1072#1074#1080#1083' '#1079#1072#1082#1072#1079#1099'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44FC826E00CB,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkotpravlyaetsyaotpravil_zakazy"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1087#1088#1072#1074#1083#1103#1077#1090#1089#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1047#1072#1082#1072#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FC826F034B,Bold.ColumnName=otpravly' +
        'aetsya,Bold.ExpressionName=otpravlyaetsya,Bold.DelphiName=otprav' +
        'lyaetsya"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1087#1088#1072#1074#1080#1083' '#1079#1072#1082#1072#1079#1099'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1055#1077#1088#1089#1086#1085#1072#1083'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FC826F035B,Bold.ColumnName=otpravil' +
        '_zakazy,Bold.ExpressionName=otpravil_zakazy,Bold.DelphiName=otpr' +
        'avil_zakazy,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1089#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1088#1072#1089#1093#1086#1076#1080#1084#1077#1077#1090' '#1088#1072#1089#1093#1086#1076#1099'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44FD723801D4,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linksostavlyaet_rashodimeet_rashody"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1089#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1088#1072#1089#1093#1086#1076'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1056#1072#1089#1093#1086#1076'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD7239002E,Bold.ColumnName=sostavly' +
        'aet_rashod,Bold.ExpressionName=sostavlyaet_rashod,Bold.DelphiNam' +
        'e=sostavlyaet_rashod"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1080#1084#1077#1077#1090' '#1088#1072#1089#1093#1086#1076#1099'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1041#1072#1083#1072#1085#1089'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD7239003E,Bold.ColumnName=imeet_ra' +
        'shody,Bold.ExpressionName=imeet_rashody,Bold.DelphiName=imeet_ra' +
        'shody,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1089#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1087#1088#1080#1093#1086#1076#1080#1084#1077#1077#1090' '#1087#1088#1080#1093#1086#1076#1099'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44FD723A02EE,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linksostavlyaet_prihodimeet_prihody"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1089#1086#1089#1090#1072#1074#1083#1103#1077#1090' '#1087#1088#1080#1093#1086#1076'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1055#1088#1080#1093#1086#1076'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD723B00CB,Bold.ColumnName=sostavly' +
        'aet_prihod,Bold.ExpressionName=sostavlyaet_prihod,Bold.DelphiNam' +
        'e=sostavlyaet_prihod"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1080#1084#1077#1077#1090' '#1087#1088#1080#1093#1086#1076#1099'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1041#1072#1083#1072#1085#1089'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FD723B00CD,Bold.ColumnName=imeet_pr' +
        'ihody,Bold.ExpressionName=imeet_prihody,Bold.DelphiName=imeet_pr' +
        'ihody,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1103#1074#1083' '#1074#1093#1086#1076#1086#1084' '#1087#1086#1083#1100#1079#1080#1084#1077#1077#1090' '#1074#1093#1086#1076#1099'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=44FFBA8602AF,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkyavl_vhodom_poljzimeet_vhody"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1103#1074#1083' '#1074#1093#1086#1076#1086#1084' '#1087#1086#1083#1100#1079'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1093#1086#1076#1099' '#1087#1086#1083#1100#1079'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFBA8700BB,Bold.ColumnName=yavl_vho' +
        'dom_poljz,Bold.ExpressionName=yavl_vhodom_poljz,Bold.DelphiName=' +
        'yavl_vhodom_poljz"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1080#1084#1077#1077#1090' '#1074#1093#1086#1076#1099'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1055#1077#1088#1089#1086#1085#1072#1083'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=44FFBA8700CB,Bold.ColumnName=imeet_vh' +
        'ody,Bold.ExpressionName=imeet_vhody,Bold.DelphiName=imeet_vhody,' +
        'Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1090#1085#1086#1089' '#1082' '#1086#1087#1077#1088#1072#1094' '#1087#1088#1080#1093#1080#1084#1077#1077#1090' '#1095#1072#1089#1090#1085' '#1087#1088#1080#1093#1086#1076#1099'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=45008A72005D,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkotnos_k_operac_prihimeet_chastn_prihody"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1085#1086#1089' '#1082' '#1086#1087#1077#1088#1072#1094' '#1087#1088#1080#1093'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1055#1088#1080#1093#1086#1076'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=45008A7202AF,Bold.ColumnName=otnos_k_' +
        'operac_prih,Bold.ExpressionName=otnos_k_operac_prih,Bold.DelphiN' +
        'ame=otnos_k_operac_prih"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1080#1084#1077#1077#1090' '#1095#1072#1089#1090#1085' '#1087#1088#1080#1093#1086#1076#1099'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1054#1087#1077#1088#1072#1094#1080#1103'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=45008A7202BF,Bold.ColumnName=imeet_ch' +
        'astn_prihody,Bold.ExpressionName=imeet_chastn_prihody,Bold.Delph' +
        'iName=imeet_chastn_prihody,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1090#1085#1086#1089' '#1082' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1088#1072#1089#1093#1086#1087#1080#1089#1099#1074#1072#1077#1090' '#1088#1072#1089#1093'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=45008A7802AF,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkotnos_k_operacii_rashopisyvaet_rash"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1085#1086#1089' '#1082' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1088#1072#1089#1093'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1056#1072#1089#1093#1086#1076'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=45008A7900FA,Bold.ColumnName=otnos_k_' +
        'operacii_rash,Bold.ExpressionName=otnos_k_operacii_rash,Bold.Del' +
        'phiName=otnos_k_operacii_rash"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1087#1080#1089#1099#1074#1072#1077#1090' '#1088#1072#1089#1093'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1054#1087#1077#1088#1072#1094#1080#1103'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=45008A790109,Bold.ColumnName=opisyvae' +
        't_rash,Bold.ExpressionName=opisyvaet_rash,Bold.DelphiName=opisyv' +
        'aet_rash,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9#9'(Association'
      #9#9#9'"'#1086#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1075#1088#1091#1087#1087#1077#1074#1082#1083#1102#1095#1072#1077#1090' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      #9#9#9'"<NONE>"'
      #9#9#9'""'
      #9#9#9'""'
      
        #9#9#9'"persistence=persistent,_BoldInternal.toolId=45519A620261,der' +
        'ived=False,_Boldify.noName=True,Bold.DelphiName=<Name>,Bold.Link' +
        'ClassName=Linkotnositsya_k_gruppevklyuchaet_voditelya"'
      #9#9#9'FALSE'
      #9#9#9'(Roles'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1086#1090#1085#1086#1089#1080#1090#1089#1103' '#1082' '#1075#1088#1091#1087#1087#1077'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1042#1086#1076#1080#1090#1077#1083#1100'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..1"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=45519A630128,Bold.ColumnName=otnosits' +
        'ya_k_gruppe,Bold.ExpressionName=otnositsya_k_gruppe,Bold.DelphiN' +
        'ame=otnositsya_k_gruppe"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9#9'(Role'
      #9#9#9#9#9'"'#1074#1082#1083#1102#1095#1072#1077#1090' '#1074#1086#1076#1080#1090#1077#1083#1103'"'
      #9#9#9#9#9'TRUE'
      #9#9#9#9#9'FALSE'
      #9#9#9#9#9'"'#1043#1088#1091#1087#1087#1072' '#1074#1086#1076#1080#1090#1077#1083#1077#1081'"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'"0..n"'
      #9#9#9#9#9'""'
      #9#9#9#9#9'0'
      #9#9#9#9#9'2'
      #9#9#9#9#9'0'
      
        #9#9#9#9#9'"_BoldInternal.toolId=45519A63012A,Bold.ColumnName=vklyucha' +
        'et_voditelya,Bold.ExpressionName=vklyuchaet_voditelya,Bold.Delph' +
        'iName=vklyuchaet_voditelya,Bold.Embed=False"'
      #9#9#9#9#9'(Qualifiers'
      #9#9#9#9#9')'
      #9#9#9#9')'
      #9#9#9')'
      #9#9')'
      #9')'
      ')')
  end
  object AllActDriverADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select pozyvnoi from Voditelj where v_rabote=1 order by pozyvnoi')
    Left = 320
    Top = 8
  end
  object NextCustNumADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select nomer_zakaza from Zakaz order by nomer_zakaza')
    Left = 216
    Top = 8
  end
  object AllDriverADOTable: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'ActiveDriversState'
    Left = 120
    Top = 200
  end
  object blhCurrSyncDriver: TBoldListHandle
    RootHandle = bsh
    Expression = 'Voditelj.allInstances->select(pozyvnoi=bv_SyncDriver)'
    Variables = bovCurrSyncDriver
    Left = 32
    Top = 248
  end
  object bovCurrSyncDriver: TBoldOclVariables
    Variables = <
      item
        BoldHandle = bvhCurrSyncDriver
        VariableName = 'bv_SyncDriver'
        UseListElement = False
      end>
    Left = 32
    Top = 200
  end
  object bvhCurrSyncDriver: TBoldVariableHandle
    StaticSystemHandle = bsh
    ValueTypeName = 'Integer'
    Left = 32
    Top = 152
  end
  object CheckCustADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'c_num'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 10
        Precision = 28
        Size = 19
        Value = 0.000000000000000000
      end>
    SQL.Strings = (
      'select * from zakaz where nomer_zakaza=:c_num')
    Left = 440
    Top = 152
  end
  object DrActCustADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from Zakaz c, Voditelj dr where (c.zavershyon=0) and '
      
        '(c.vypolnyaetsya_voditelem=dr.BOLD_ID) and (dr.pozyvnoi=:dr_num)' +
        ' '
      'and (c.Arhivnyi=0)')
    Left = 320
    Top = 104
  end
  object PersonaIDByLoginADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = 'empty'
      end>
    SQL.Strings = (
      'select * from Personal where login=:login')
    Left = 216
    Top = 104
  end
  object CurrUserADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'login'
        DataType = ftString
        Size = 255
        Value = 'empty'
      end>
    SQL.Strings = (
      'select * from Personal where login=:login')
    Left = 440
    Top = 200
  end
  object MainADOCommand: TADOCommand
    CommandTimeout = 3000
    Connection = ADOConnection
    Parameters = <>
    Left = 440
    Top = 248
  end
  object SectorByIDADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from Sektor_raboty where BOLD_ID=:id')
    Left = 320
    Top = 152
  end
  object UnionOADOTable: TADOTable
    Connection = ADOConnection
    TableName = 'Objekt_vyborki_otchyotnosti'
    Left = 216
    Top = 248
  end
  object HistoryTNumADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tnum'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = '12345'
      end>
    SQL.Strings = (
      
        'select * from Sootvetstvie_parametrov_zakaza where Telefon_klien' +
        'ta=:tnum')
    Left = 120
    Top = 296
  end
  object HasAllBonusADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *,(obshepriz_chislo-obshepriz_schyotchik) as pval  from '
      'Objekt_vyborki_otchyotnosti')
    Left = 320
    Top = 200
    object HasAllBonusADOQueryBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object HasAllBonusADOQueryBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object HasAllBonusADOQueryTip_objekta: TStringField
      FieldName = 'Tip_objekta'
      Size = 255
    end
    object HasAllBonusADOQueryData_nachala: TDateTimeField
      FieldName = 'Data_nachala'
    end
    object HasAllBonusADOQueryData_konca: TDateTimeField
      FieldName = 'Data_konca'
    end
    object HasAllBonusADOQueryProcent_otchisleniya: TBCDField
      FieldName = 'Procent_otchisleniya'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryFiljtr_pozyvnoi: TIntegerField
      FieldName = 'Filjtr_pozyvnoi'
    end
    object HasAllBonusADOQueryFiljtr_data_nachala: TDateTimeField
      FieldName = 'Filjtr_data_nachala'
    end
    object HasAllBonusADOQueryFiljtr_data_konca: TDateTimeField
      FieldName = 'Filjtr_data_konca'
    end
    object HasAllBonusADOQueryCvet_prinyatyh: TStringField
      FieldName = 'Cvet_prinyatyh'
      Size = 255
    end
    object HasAllBonusADOQueryCvet_nachavshihsya: TStringField
      FieldName = 'Cvet_nachavshihsya'
      Size = 255
    end
    object HasAllBonusADOQueryCvet_okonchivshihsya: TStringField
      FieldName = 'Cvet_okonchivshihsya'
      Size = 255
    end
    object HasAllBonusADOQueryVybratj_poslednie_nesk_dnei: TIntegerField
      FieldName = 'Vybratj_poslednie_nesk_dnei'
    end
    object HasAllBonusADOQueryKol_posl_dnei: TBCDField
      FieldName = 'Kol_posl_dnei'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryData_minus_vybir_dni: TDateTimeField
      FieldName = 'Data_minus_vybir_dni'
    end
    object HasAllBonusADOQueryNomer_pozyvnoi_filjtr: TIntegerField
      FieldName = 'Nomer_pozyvnoi_filjtr'
    end
    object HasAllBonusADOQueryCvet_predvarit: TStringField
      FieldName = 'Cvet_predvarit'
      Size = 255
    end
    object HasAllBonusADOQueryData_po_umolchaniyu: TDateTimeField
      FieldName = 'Data_po_umolchaniyu'
    end
    object HasAllBonusADOQueryAvtozapoln_sektorov: TIntegerField
      FieldName = 'Avtozapoln_sektorov'
    end
    object HasAllBonusADOQueryNaznach_iz_obsh__spiska: TIntegerField
      FieldName = 'Naznach_iz_obsh__spiska'
    end
    object HasAllBonusADOQueryrep_time: TDateTimeField
      FieldName = 'rep_time'
    end
    object HasAllBonusADOQueryAvtozap_konechn_sekt: TIntegerField
      FieldName = 'Avtozap_konechn_sekt'
    end
    object HasAllBonusADOQueryAvtozap_nach_sektora: TIntegerField
      FieldName = 'Avtozap_nach_sektora'
    end
    object HasAllBonusADOQuerySoobsh_o_netochn_sekt_reg: TIntegerField
      FieldName = 'Soobsh_o_netochn_sekt_reg'
    end
    object HasAllBonusADOQueryZapros_konech_sektora: TIntegerField
      FieldName = 'Zapros_konech_sektora'
    end
    object HasAllBonusADOQueryZapros_nach_sektora: TIntegerField
      FieldName = 'Zapros_nach_sektora'
    end
    object HasAllBonusADOQueryIspoljz_priz_1: TIntegerField
      FieldName = 'Ispoljz_priz_1'
    end
    object HasAllBonusADOQueryIspoljz_priz_2: TIntegerField
      FieldName = 'Ispoljz_priz_2'
    end
    object HasAllBonusADOQueryIspoljz_priz_3: TIntegerField
      FieldName = 'Ispoljz_priz_3'
    end
    object HasAllBonusADOQueryKoeff_prizov_sbavki_1: TBCDField
      FieldName = 'Koeff_prizov_sbavki_1'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryKoeff_prizov_sbavki_2: TBCDField
      FieldName = 'Koeff_prizov_sbavki_2'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryKoeff_prizov_sbavki_3: TBCDField
      FieldName = 'Koeff_prizov_sbavki_3'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryPrizovoe_kolichestvo_1: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_1'
    end
    object HasAllBonusADOQueryPrizovoe_kolichestvo_2: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_2'
    end
    object HasAllBonusADOQueryPrizovoe_kolichestvo_3: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_3'
    end
    object HasAllBonusADOQueryVelichina_priz_sbavki_1: TBCDField
      FieldName = 'Velichina_priz_sbavki_1'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryVelichina_priz_sbavki_2: TBCDField
      FieldName = 'Velichina_priz_sbavki_2'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryVelichina_priz_sbavki_3: TBCDField
      FieldName = 'Velichina_priz_sbavki_3'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryRegim_dispetchera: TIntegerField
      FieldName = 'Regim_dispetchera'
    end
    object HasAllBonusADOQueryEstj_nachatye: TIntegerField
      FieldName = 'Estj_nachatye'
    end
    object HasAllBonusADOQueryEstj_otpravlennye: TIntegerField
      FieldName = 'Estj_otpravlennye'
    end
    object HasAllBonusADOQueryNe_uchit_zanyat_drug_disp: TIntegerField
      FieldName = 'Ne_uchit_zanyat_drug_disp'
    end
    object HasAllBonusADOQueryKolich_deg_grupp: TIntegerField
      FieldName = 'Kolich_deg_grupp'
    end
    object HasAllBonusADOQueryPer_obnovl_deg: TStringField
      FieldName = 'Per_obnovl_deg'
      Size = 255
    end
    object HasAllBonusADOQueryPer_obnovl_obychn_vod: TStringField
      FieldName = 'Per_obnovl_obychn_vod'
      Size = 255
    end
    object HasAllBonusADOQuerySutki_deg_gruppy: TDateTimeField
      FieldName = 'Sutki_deg_gruppy'
    end
    object HasAllBonusADOQueryTek_deg_gruppa: TIntegerField
      FieldName = 'Tek_deg_gruppa'
    end
    object HasAllBonusADOQueryVr_smeny_deg_grupp: TStringField
      FieldName = 'Vr_smeny_deg_grupp'
      Size = 255
    end
    object HasAllBonusADOQueryKolich_vyd_benzina: TBCDField
      FieldName = 'Kolich_vyd_benzina'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryKomment_k_rabote: TStringField
      FieldName = 'Komment_k_rabote'
      Size = 255
    end
    object HasAllBonusADOQueryNamen_organizacii: TStringField
      FieldName = 'Namen_organizacii'
      Size = 255
    end
    object HasAllBonusADOQueryNapravlenie_1: TStringField
      FieldName = 'Napravlenie_1'
      Size = 255
    end
    object HasAllBonusADOQueryNapravlenie_2: TStringField
      FieldName = 'Napravlenie_2'
      Size = 255
    end
    object HasAllBonusADOQueryNapravlenie_3: TStringField
      FieldName = 'Napravlenie_3'
      Size = 255
    end
    object HasAllBonusADOQueryNom_putevogo_lista: TIntegerField
      FieldName = 'Nom_putevogo_lista'
    end
    object HasAllBonusADOQueryPutev_list_seriya: TStringField
      FieldName = 'Putev_list_seriya'
      Size = 255
    end
    object HasAllBonusADOQueryBetweenOnEnd: TDateTimeField
      FieldName = 'BetweenOnEnd'
    end
    object HasAllBonusADOQueryBetweenSetOn: TDateTimeField
      FieldName = 'BetweenSetOn'
    end
    object HasAllBonusADOQueryBetweenStartSet: TDateTimeField
      FieldName = 'BetweenStartSet'
    end
    object HasAllBonusADOQueryBetweenOnEndColor: TStringField
      FieldName = 'BetweenOnEndColor'
      Size = 255
    end
    object HasAllBonusADOQueryBetweenSetOnColor: TStringField
      FieldName = 'BetweenSetOnColor'
      Size = 255
    end
    object HasAllBonusADOQueryBetweenStartSetColor: TStringField
      FieldName = 'BetweenStartSetColor'
      Size = 255
    end
    object HasAllBonusADOQueryBetweenSetEnd: TDateTimeField
      FieldName = 'BetweenSetEnd'
    end
    object HasAllBonusADOQueryBetweenSetEndColor: TStringField
      FieldName = 'BetweenSetEndColor'
      Size = 255
    end
    object HasAllBonusADOQueryViewSetEndLong: TIntegerField
      FieldName = 'ViewSetEndLong'
    end
    object HasAllBonusADOQuerycvet_obshepriz: TStringField
      FieldName = 'cvet_obshepriz'
      Size = 255
    end
    object HasAllBonusADOQuerycvet_so_skidkoi: TStringField
      FieldName = 'cvet_so_skidkoi'
      Size = 255
    end
    object HasAllBonusADOQueryobshepriz_chislo: TIntegerField
      FieldName = 'obshepriz_chislo'
    end
    object HasAllBonusADOQueryobshepriz_schyotchik: TIntegerField
      FieldName = 'obshepriz_schyotchik'
    end
    object HasAllBonusADOQuerysimv_avtom_ustan: TIntegerField
      FieldName = 'simv_avtom_ustan'
    end
    object HasAllBonusADOQueryschit_okon_posl_kon_sekt: TIntegerField
      FieldName = 'schit_okon_posl_kon_sekt'
    end
    object HasAllBonusADOQueryvr_smeny_dispetcherov: TStringField
      FieldName = 'vr_smeny_dispetcherov'
      Size = 255
    end
    object HasAllBonusADOQueryuse_bonus3: TIntegerField
      FieldName = 'use_bonus3'
    end
    object HasAllBonusADOQueryuse_bonus4: TIntegerField
      FieldName = 'use_bonus4'
    end
    object HasAllBonusADOQueryPrizovoe_kolichestvo_4: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_4'
    end
    object HasAllBonusADOQuerypval: TIntegerField
      FieldName = 'pval'
      ReadOnly = True
    end
    object HasAllBonusADOQueryDAYLY_SALE: TBCDField
      FieldName = 'DAYLY_SALE'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryMIN_DEBET: TBCDField
      FieldName = 'MIN_DEBET'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryview_bonuses: TIntegerField
      FieldName = 'view_bonuses'
    end
    object HasAllBonusADOQueryview_ab_bonuses: TIntegerField
      FieldName = 'view_ab_bonuses'
    end
    object HasAllBonusADOQueryuse_ab_account: TIntegerField
      FieldName = 'use_ab_account'
    end
    object HasAllBonusADOQuerydb_version: TIntegerField
      FieldName = 'db_version'
    end
    object HasAllBonusADOQueryuse_dr_priority: TIntegerField
      FieldName = 'use_dr_priority'
    end
    object HasAllBonusADOQuerydir_dr_autoset: TIntegerField
      FieldName = 'dir_dr_autoset'
    end
    object HasAllBonusADOQueryauto_order_arhive: TIntegerField
      FieldName = 'auto_order_arhive'
    end
    object HasAllBonusADOQuerylast_arh_date: TDateTimeField
      FieldName = 'last_arh_date'
    end
    object HasAllBonusADOQuerymin_days_delta: TIntegerField
      FieldName = 'min_days_delta'
    end
    object HasAllBonusADOQuerysectors_wbroadcast: TStringField
      FieldName = 'sectors_wbroadcast'
      Size = 5000
    end
    object HasAllBonusADOQueryuse_sect_wbroadcast: TIntegerField
      FieldName = 'use_sect_wbroadcast'
    end
    object HasAllBonusADOQueryhas_sect_wbroadcast: TIntegerField
      FieldName = 'has_sect_wbroadcast'
    end
    object HasAllBonusADOQuerysync_busy_accounting: TIntegerField
      FieldName = 'sync_busy_accounting'
    end
    object HasAllBonusADOQuerycurr_mob_version: TIntegerField
      FieldName = 'curr_mob_version'
    end
    object HasAllBonusADOQuerymin_mob_version: TIntegerField
      FieldName = 'min_mob_version'
    end
    object HasAllBonusADOQuerymandatory_update: TIntegerField
      FieldName = 'mandatory_update'
    end
    object HasAllBonusADOQueryaddit_rem_params: TStringField
      DisplayWidth = 4000
      FieldName = 'addit_rem_params'
      Size = 4000
    end
    object HasAllBonusADOQueryGPS_SRV_ADR: TStringField
      FieldName = 'GPS_SRV_ADR'
      Size = 255
    end
    object HasAllBonusADOQueryforders_wbroadcast: TStringField
      FieldName = 'forders_wbroadcast'
      Size = 5000
    end
    object HasAllBonusADOQueryuse_ford_wbroadcast: TIntegerField
      FieldName = 'use_ford_wbroadcast'
    end
    object HasAllBonusADOQueryhas_ford_wbroadcast: TIntegerField
      FieldName = 'has_ford_wbroadcast'
    end
    object HasAllBonusADOQueryto_show_fords: TSmallintField
      FieldName = 'to_show_fords'
    end
    object HasAllBonusADOQueryclsms_ordground: TSmallintField
      FieldName = 'clsms_ordground'
    end
    object HasAllBonusADOQuerysend_wait_info: TSmallintField
      FieldName = 'send_wait_info'
    end
    object HasAllBonusADOQuerysend_prev_wait: TSmallintField
      FieldName = 'send_prev_wait'
    end
    object HasAllBonusADOQueryuse_dr_balance_counter: TIntegerField
      FieldName = 'use_dr_balance_counter'
    end
    object HasAllBonusADOQuerydont_reset_dr_queue: TSmallintField
      FieldName = 'dont_reset_dr_queue'
    end
    object HasAllBonusADOQueryodirect_to_dsect: TSmallintField
      FieldName = 'odirect_to_dsect'
    end
    object HasAllBonusADOQueryftime_tariff: TBCDField
      FieldName = 'ftime_tariff'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryrecalc_on_timeset: TSmallintField
      FieldName = 'recalc_on_timeset'
    end
    object HasAllBonusADOQuerydrcalc_start_date: TWideStringField
      FieldName = 'drcalc_start_date'
      Size = 10
    end
    object HasAllBonusADOQueryorder_sort_dr_assign: TSmallintField
      FieldName = 'order_sort_dr_assign'
    end
    object HasAllBonusADOQuerytmeter_tariff: TBCDField
      FieldName = 'tmeter_tariff'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerytaropt_accounting: TSmallintField
      FieldName = 'taropt_accounting'
    end
    object HasAllBonusADOQueryautotarif_by_driver: TSmallintField
      FieldName = 'autotarif_by_driver'
    end
    object HasAllBonusADOQueryovertar_by_driver: TSmallintField
      FieldName = 'overtar_by_driver'
    end
    object HasAllBonusADOQueryautotarif_by_tplan: TSmallintField
      FieldName = 'autotarif_by_tplan'
    end
    object HasAllBonusADOQueryday_payment: TBCDField
      FieldName = 'day_payment'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerymanual_day_sale: TSmallintField
      FieldName = 'manual_day_sale'
    end
    object HasAllBonusADOQuerydayli_pay_time_offset: TIntegerField
      FieldName = 'dayli_pay_time_offset'
    end
    object HasAllBonusADOQuerynew_wperiod_opercent: TBCDField
      FieldName = 'new_wperiod_opercent'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerycheck_net_time: TSmallintField
      FieldName = 'check_net_time'
    end
    object HasAllBonusADOQuerylast_net_time: TDateTimeField
      FieldName = 'last_net_time'
    end
    object HasAllBonusADOQuerytest_phone: TStringField
      FieldName = 'test_phone'
      Size = 50
    end
    object HasAllBonusADOQuerydisp_phone: TStringField
      FieldName = 'disp_phone'
      Size = 50
    end
    object HasAllBonusADOQuerymanager_phone: TStringField
      FieldName = 'manager_phone'
      Size = 50
    end
    object HasAllBonusADOQuerycall_demon_locsip_name: TStringField
      FieldName = 'call_demon_locsip_name'
      Size = 50
    end
    object HasAllBonusADOQuerycall_demon_netsip_name: TStringField
      FieldName = 'call_demon_netsip_name'
      Size = 50
    end
    object HasAllBonusADOQuerydemon_call_ctx: TStringField
      FieldName = 'demon_call_ctx'
      Size = 50
    end
    object HasAllBonusADOQuerydemon_call_virtext: TStringField
      FieldName = 'demon_call_virtext'
      Size = 50
    end
    object HasAllBonusADOQuerydemon_call_priority: TStringField
      FieldName = 'demon_call_priority'
    end
    object HasAllBonusADOQuerydemon_call_timeout: TStringField
      FieldName = 'demon_call_timeout'
    end
    object HasAllBonusADOQuerydemon_callerid: TStringField
      FieldName = 'demon_callerid'
      Size = 50
    end
    object HasAllBonusADOQueryclord_sort_dassign: TSmallintField
      FieldName = 'clord_sort_dassign'
    end
    object HasAllBonusADOQuerymax_clrereg_cnt: TSmallintField
      FieldName = 'max_clrereg_cnt'
    end
    object HasAllBonusADOQueryfix_order_pay_with_daily_pay: TSmallintField
      FieldName = 'fix_order_pay_with_daily_pay'
    end
    object HasAllBonusADOQueryclsms_onplaceto: TSmallintField
      FieldName = 'clsms_onplaceto'
    end
    object HasAllBonusADOQuerydont_show_auto_count: TSmallintField
      FieldName = 'dont_show_auto_count'
    end
    object HasAllBonusADOQuerydont_show_auto_coords: TSmallintField
      FieldName = 'dont_show_auto_coords'
    end
    object HasAllBonusADOQuerydont_show_driver_info: TSmallintField
      FieldName = 'dont_show_driver_info'
    end
    object HasAllBonusADOQueryauto_bsector_longorders: TSmallintField
      FieldName = 'auto_bsector_longorders'
    end
    object HasAllBonusADOQueryauto_bsectorid_longorders: TIntegerField
      FieldName = 'auto_bsectorid_longorders'
    end
    object HasAllBonusADOQueryauto_bsector_longtime: TIntegerField
      FieldName = 'auto_bsector_longtime'
    end
    object HasAllBonusADOQueryauto_bsector_onlineorders: TSmallintField
      FieldName = 'auto_bsector_onlineorders'
    end
    object HasAllBonusADOQueryauto_bsectorid_onlineorders: TIntegerField
      FieldName = 'auto_bsectorid_onlineorders'
    end
    object HasAllBonusADOQueryauto_bsector_onlinetime: TIntegerField
      FieldName = 'auto_bsector_onlinetime'
    end
    object HasAllBonusADOQueryauto_neardriver_onlineorders: TSmallintField
      FieldName = 'auto_neardriver_onlineorders'
    end
    object HasAllBonusADOQueryauto_neardriver_onlinetime: TIntegerField
      FieldName = 'auto_neardriver_onlinetime'
    end
    object HasAllBonusADOQueryneardriver_online_byord_geocode: TSmallintField
      FieldName = 'neardriver_online_byord_geocode'
    end
    object HasAllBonusADOQueryauto_neardriver_allorders: TSmallintField
      FieldName = 'auto_neardriver_allorders'
    end
    object HasAllBonusADOQueryauto_neardriver_alltime: TIntegerField
      FieldName = 'auto_neardriver_alltime'
    end
    object HasAllBonusADOQueryneardriver_all_byord_geocode: TSmallintField
      FieldName = 'neardriver_all_byord_geocode'
    end
    object HasAllBonusADOQueryclsms_offlinedr_assign: TSmallintField
      FieldName = 'clsms_offlinedr_assign'
    end
    object HasAllBonusADOQueryuse_kladr: TSmallintField
      FieldName = 'use_kladr'
    end
    object HasAllBonusADOQuerykladr_object_code: TStringField
      FieldName = 'kladr_object_code'
      Size = 50
    end
    object HasAllBonusADOQuerycurrency_short: TStringField
      FieldName = 'currency_short'
      Size = 50
    end
    object HasAllBonusADOQuerystate_phone_code: TStringField
      FieldName = 'state_phone_code'
      Size = 50
    end
    object HasAllBonusADOQueryuse_fordbroadcast_priority: TSmallintField
      FieldName = 'use_fordbroadcast_priority'
    end
    object HasAllBonusADOQueryauto_bsect_notmanual_ord: TSmallintField
      FieldName = 'auto_bsect_notmanual_ord'
    end
    object HasAllBonusADOQueryauto_close_client_canceling: TSmallintField
      FieldName = 'auto_close_client_canceling'
    end
    object HasAllBonusADOQueryauto_close_clcancel_time: TIntegerField
      FieldName = 'auto_close_clcancel_time'
    end
    object HasAllBonusADOQuerysip1_robot_active_time: TDateTimeField
      FieldName = 'sip1_robot_active_time'
    end
    object HasAllBonusADOQuerysip2_robot_active_time: TDateTimeField
      FieldName = 'sip2_robot_active_time'
    end
    object HasAllBonusADOQueryrobot_active_time_interval: TIntegerField
      FieldName = 'robot_active_time_interval'
    end
    object HasAllBonusADOQueryreplace_sms_with_robot: TSmallintField
      FieldName = 'replace_sms_with_robot'
    end
    object HasAllBonusADOQueryuse_call_robot: TSmallintField
      FieldName = 'use_call_robot'
    end
    object HasAllBonusADOQuerystart_first_song_code: TIntegerField
      FieldName = 'start_first_song_code'
    end
    object HasAllBonusADOQueryonplace_first_song_code: TIntegerField
      FieldName = 'onplace_first_song_code'
    end
    object HasAllBonusADOQueryweb_protected_code: TStringField
      FieldName = 'web_protected_code'
      Size = 50
    end
    object HasAllBonusADOQueryauto_arh_empty_orders: TSmallintField
      FieldName = 'auto_arh_empty_orders'
    end
    object HasAllBonusADOQueryno_percent_before: TSmallintField
      FieldName = 'no_percent_before'
    end
    object HasAllBonusADOQueryno_percent_before_summ: TBCDField
      FieldName = 'no_percent_before_summ'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryno_percent_before_payment: TBCDField
      FieldName = 'no_percent_before_payment'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQueryuse_prize_reserved_limit: TSmallintField
      FieldName = 'use_prize_reserved_limit'
    end
    object HasAllBonusADOQueryprize_reserved_limit: TIntegerField
      FieldName = 'prize_reserved_limit'
    end
    object HasAllBonusADOQueryprize_reward_summ: TBCDField
      FieldName = 'prize_reward_summ'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerylock_reserv_on_limit: TSmallintField
      FieldName = 'lock_reserv_on_limit'
    end
    object HasAllBonusADOQueryfirst_trip_bonus: TBCDField
      FieldName = 'first_trip_bonus'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerytrip_bonus: TBCDField
      FieldName = 'trip_bonus'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerypercent_bonus_min_summ: TBCDField
      FieldName = 'percent_bonus_min_summ'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerybonus_percent: TBCDField
      FieldName = 'bonus_percent'
      Precision = 28
      Size = 10
    end
    object HasAllBonusADOQuerylock_free_orders_info: TSmallintField
      FieldName = 'lock_free_orders_info'
    end
    object HasAllBonusADOQueryuse_drivers_rating: TSmallintField
      FieldName = 'use_drivers_rating'
    end
    object HasAllBonusADOQuerybase_referral_bonus: TBCDField
      FieldName = 'base_referral_bonus'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQuerybase_ref_bonus_interval: TIntegerField
      FieldName = 'base_ref_bonus_interval'
    end
    object HasAllBonusADOQueryold_order_rating_bonus: TBCDField
      FieldName = 'old_order_rating_bonus'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQueryorder_rating_bonus: TBCDField
      FieldName = 'order_rating_bonus'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQuerypeak_one_start: TWideStringField
      FieldName = 'peak_one_start'
      EditMask = '!90:00;1;_'
      Size = 16
    end
    object HasAllBonusADOQuerypeak_one_lenght: TSmallintField
      FieldName = 'peak_one_lenght'
    end
    object HasAllBonusADOQuerypeak_one_bonus: TBCDField
      FieldName = 'peak_one_bonus'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQuerypeak_two_start: TWideStringField
      FieldName = 'peak_two_start'
      EditMask = '!90:00;1;_'
      Size = 16
    end
    object HasAllBonusADOQuerypeak_two_lenght: TSmallintField
      FieldName = 'peak_two_lenght'
    end
    object HasAllBonusADOQuerypeak_two_bonus: TBCDField
      FieldName = 'peak_two_bonus'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQuerypeak_three_start: TWideStringField
      FieldName = 'peak_three_start'
      EditMask = '!90:00;1;_'
      Size = 16
    end
    object HasAllBonusADOQuerypeak_three_lenght: TSmallintField
      FieldName = 'peak_three_lenght'
    end
    object HasAllBonusADOQuerypeak_three_bonus: TBCDField
      FieldName = 'peak_three_bonus'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQuerybase_referral_cashback: TBCDField
      FieldName = 'base_referral_cashback'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQueryorder_late_rating_fine: TBCDField
      FieldName = 'order_late_rating_fine'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQueryorder_refusal_rating_fine: TBCDField
      FieldName = 'order_refusal_rating_fine'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQueryorder_refusal_balance_fine: TBCDField
      FieldName = 'order_refusal_balance_fine'
      Precision = 18
      Size = 5
    end
    object HasAllBonusADOQueryold_order_time: TIntegerField
      FieldName = 'old_order_time'
    end
    object HasAllBonusADOQueryorder_late_rating_time: TIntegerField
      FieldName = 'order_late_rating_time'
    end
    object HasAllBonusADOQueryorder_refusal_rating_time: TIntegerField
      FieldName = 'order_refusal_rating_time'
    end
    object HasAllBonusADOQueryorder_rating_bonus_time: TIntegerField
      FieldName = 'order_rating_bonus_time'
    end
    object HasAllBonusADOQueryold_order_rbonus_time: TIntegerField
      FieldName = 'old_order_rbonus_time'
    end
    object HasAllBonusADOQuerypeak_one_bonus_time: TIntegerField
      FieldName = 'peak_one_bonus_time'
    end
    object HasAllBonusADOQuerypeak_two_bonus_time: TIntegerField
      FieldName = 'peak_two_bonus_time'
    end
    object HasAllBonusADOQuerypeak_three_bonus_time: TIntegerField
      FieldName = 'peak_three_bonus_time'
    end
    object HasAllBonusADOQueryreferral_rbonus_expire: TIntegerField
      FieldName = 'referral_rbonus_expire'
    end
    object HasAllBonusADOQueryrating_pretendent_sorting: TSmallintField
      FieldName = 'rating_pretendent_sorting'
    end
    object HasAllBonusADOQueryauto_detect_sector_by_addr: TSmallintField
      FieldName = 'auto_detect_sector_by_addr'
    end
    object HasAllBonusADOQuerygeocode_default_prefix: TStringField
      FieldName = 'geocode_default_prefix'
      Size = 255
    end
    object HasAllBonusADOQueryauto_detect_driver_sector: TSmallintField
      FieldName = 'auto_detect_driver_sector'
    end
    object HasAllBonusADOQueryuse_opengts_monitoring: TSmallintField
      FieldName = 'use_opengts_monitoring'
    end
    object HasAllBonusADOQueryon_gps_signaling: TSmallintField
      FieldName = 'on_gps_signaling'
    end
    object HasAllBonusADOQuerydnts_wait_oth_company: TSmallintField
      FieldName = 'dnts_wait_oth_company'
    end
    object HasAllBonusADOQuerydnts_wait_wtout_company: TSmallintField
      FieldName = 'dnts_wait_wtout_company'
    end
    object HasAllBonusADOQueryauto_show_wait_dialog: TSmallintField
      FieldName = 'auto_show_wait_dialog'
    end
    object HasAllBonusADOQuerywait_dlg_with_sectors: TSmallintField
      FieldName = 'wait_dlg_with_sectors'
    end
    object HasAllBonusADOQuerydispatcher_phone: TStringField
      FieldName = 'dispatcher_phone'
      Size = 50
    end
    object HasAllBonusADOQueryalart_order_confirm: TSmallintField
      FieldName = 'alart_order_confirm'
    end
    object HasAllBonusADOQueryconfirm_lineout_on_exit: TSmallintField
      FieldName = 'confirm_lineout_on_exit'
    end
    object HasAllBonusADOQueryhide_other_sect_wait_orders: TSmallintField
      FieldName = 'hide_other_sect_wait_orders'
    end
    object HasAllBonusADOQuerydont_wait_in_busy_state: TSmallintField
      FieldName = 'dont_wait_in_busy_state'
    end
    object HasAllBonusADOQueryshow_all_sectwait_manual: TSmallintField
      FieldName = 'show_all_sectwait_manual'
    end
    object HasAllBonusADOQuerytaxm_block_wtout_onplace: TSmallintField
      FieldName = 'taxm_block_wtout_onplace'
    end
    object HasAllBonusADOQueryreserved_ip: TStringField
      FieldName = 'reserved_ip'
      Size = 50
    end
    object HasAllBonusADOQuerystart_free_distance: TIntegerField
      FieldName = 'start_free_distance'
    end
    object HasAllBonusADOQuerystart_free_time: TIntegerField
      FieldName = 'start_free_time'
    end
    object HasAllBonusADOQueryauto_assign_driver_by_coords: TSmallintField
      FieldName = 'auto_assign_driver_by_coords'
    end
    object HasAllBonusADOQueryaass_driver_max_radius: TIntegerField
      FieldName = 'aass_driver_max_radius'
    end
  end
  object AdrPhoneRelatingADOTable: TADOTable
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    TableName = 'Sootvetstvie_parametrov_zakaza'
    Left = 120
    Top = 248
  end
  object IndividPersonsADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select * from Persona where Elektronnyi_adres='#39#1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1082#1083 +
        #1080#1077#1085#1090#39)
    Left = 216
    Top = 200
  end
  object IPersPerINumADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'inum'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = -1
      end>
    SQL.Strings = (
      'select * from Persona where (korpus=:inum) and '
      ' (Elektronnyi_adres='#39#1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1082#1083#1080#1077#1085#1090#39') '
      ' ')
    Left = 440
    Top = 296
  end
  object IPersPerINumDS: TDataSource
    DataSet = IPersPerINumADOQuery
    Left = 32
    Top = 296
  end
  object NewINumADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select (MAX(korpus)+1) as new_in from Persona '
      'where (Elektronnyi_adres='#39#1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1082#1083#1080#1077#1085#1090#39') ')
    Left = 216
    Top = 296
  end
  object HistoryINumADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'inum'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select ISNULL(sum(dom),0) as OrderCount from Persona where korpu' +
        's=:inum')
    Left = 320
    Top = 296
  end
  object INumPourPhoneADOQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'phone'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select * from Persona where (Rabochii_telefon=:phone) and '
      ' (Elektronnyi_adres='#39#1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1082#1083#1080#1077#1085#1090#39') ')
    Left = 216
    Top = 152
  end
  object HasAllBonusDS: TDataSource
    DataSet = HasAllBonusADOQuery
    Left = 320
    Top = 248
  end
  object BadPhoneRelADOTable: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'Plohie_klienty'
    Left = 32
    Top = 352
  end
  object KLADRCITYDS: TDataSource
    DataSet = KLADRCITYADOTable
    Left = 216
    Top = 352
  end
  object KLADRCITYADOTable: TADODataSet
    Connection = ADOConnection
    CommandText = 
      'select (['#1057#1090#1086#1083#1073#1077#1094' 0] +'#39'('#39'+ ['#1057#1090#1086#1083#1073#1077#1094' 1] +'#39', '#39'+ ['#1057#1090#1086#1083#1073#1077#1094' 3] +'#39')'#39') a' +
      's  ['#1057#1090#1086#1083#1073#1077#1094' 0] , ['#1057#1090#1086#1083#1073#1077#1094' 2] from KLADR_KLADR'#13#10'ORDER BY  ['#1057#1090#1086#1083#1073#1077 +
      #1094' 0] ASC'
    Parameters = <>
    Left = 120
    Top = 352
  end
end