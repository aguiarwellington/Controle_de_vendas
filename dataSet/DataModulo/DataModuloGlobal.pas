unit DataModuloGlobal;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.SQLiteWrapper.Stat,
  Data.DB,
  FireDAC.Comp.Client,


  DataSet.Serialize.Config,
  DataSet.Serialize,
  system.JSON,
  firedac.DApt;

type
  TDm = class(TDataModule)
    Conn: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConnBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    Procedure  CarregarConfigDB(Connection: TFDConnection);
  public
    { Public declarations }
    function ClienteListar(filtro:string): TJsonArray;

  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDm }

procedure TDm.CarregarConfigDB(Connection: TFDConnection);
begin
  Connection.driverName:= 'SQLite';

  with Connection.Params do
  begin
    clear;
    add('DriverID=SQLite');

    //Caminho do banco na pasta
    add('DataBase=C:\Users\well well\Desktop\Estudo TI\projetoVCL\Controle de vendas\Controle_de_vendas\dataSet\DataBase\Banco.db');

    add('User_name=');
    add('Password=');
    add('Port=');
    add('Server=');
    add('Protocol=');
    add('LockingModel=Normal');
  end;
end;

procedure TDm.ConnBeforeConnect(Sender: TObject);
begin
  CarregarConfigDB(Conn);
end;

procedure TDm.DataModuleCreate(Sender: TObject);
begin

  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator:= '.';

  Conn.Connected := true;
end;


function TDm.ClienteListar(filtro:string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('select *');
    qry.SQL.Add('from clientes');

    if filtro <> '' then
    begin
      qry.SQL.add('where nome like :filtro');
      qry.ParamByName('filtro').Value := '%' + filtro + '%';
    end;

      qry.SQL.add('order by nome');
      qry.Active := true;

      result := qry.ToJSONArray;

  finally
    freeAndNil(qry);


  end;

end;

end.
