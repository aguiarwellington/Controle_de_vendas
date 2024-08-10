object Dm: TDm
  OnCreate = DataModuleCreate
  Height = 473
  Width = 686
  object Conn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\well well\Desktop\Estudo TI\projetoVCL\Control' +
        'e de vendas\Controle_de_vendas\dataSet\DataBase\Banco.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = ConnBeforeConnect
    Left = 24
    Top = 16
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 152
    Top = 16
  end
end
