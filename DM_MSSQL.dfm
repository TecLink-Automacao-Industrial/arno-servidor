object DM: TDM
  OldCreateOrder = False
  Left = 372
  Top = 231
  Height = 327
  Width = 490
  object SS: TServerSocket
    Active = False
    Port = 10010
    ServerType = stNonBlocking
    OnClientConnect = SSClientConnect
    OnClientDisconnect = SSClientDisconnect
    OnClientRead = SSClientRead
    OnClientError = SSClientError
    Left = 40
    Top = 32
  end
  object DB_ADO: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=dwb1978;Persist Security Info=True;' +
      'User ID=sa;Initial Catalog=ARNO;Data Source=dell5000'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 96
  end
  object qDB: TTecQueryADO
    Connection = DB_ADO
    LockType = ltReadOnly
    Parameters = <>
    CheckRequestLive = True
    Versao_Biblioteca = '25/06/2012'
    RequestLive = False
    Left = 56
    Top = 160
  end
end
