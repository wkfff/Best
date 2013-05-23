object dbs: Tdbs
  OldCreateOrder = False
  Left = 557
  Top = 216
  Height = 227
  Width = 364
  object adoc: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Develop\MK2000\d' +
      'ados\imk.mdb;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 64
    Top = 96
  end
  object INTERDB: TDatabase
    DatabaseName = 'iDB'
    DriverName = 'INTRBASE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=C:\DEVELOP\TECDATA\CAT\DADOS\FIN.GDB'
      'USER NAME=SYSDBA'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'WAIT ON LOCKS=FALSE'
      'COMMIT RETAIN=FALSE'
      'ROLE NAME='
      'PASSWORD=arcanjo')
    SessionName = 'Default'
    Left = 40
    Top = 24
  end
end
