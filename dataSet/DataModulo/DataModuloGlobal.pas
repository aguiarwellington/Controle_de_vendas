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
  uMd5,


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
    function ProdutoListar(filtro: string): TJsonArray;
    function ClienteListarId(id_cliente: integer): TJsonObject;
    function ClienteInserir( nome,endereco,complemento,bairro,cidade,uf: string): TJsonObject;
    function ClienteEditar(id_cliente: integer; nome, endereco, complemento, bairro, cidade, uf: string): TJsonObject;
    function ClienteExcluir(id_cliente: integer): TJsonObject;
    function usuarioLogin(email, senha: string): TJsonObject;
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


function TDm.ClienteInserir(nome, endereco, complemento, bairro,cidade,
                            uf: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('insert into clientes(nome,endereco,complemento,bairro,cidade,uf)');
    qry.SQL.Add('values(:nome, :endereco, :complemento, :bairro, :cidade, :uf);');
    qry.SQL.Add('select last_insert_rowid() as id_cliente');

    qry.ParamByName('nome').Value:= nome;
    qry.ParamByName('endereco').Value:= endereco;
    qry.ParamByName('complemento').Value:= complemento;
    qry.ParamByName('bairro').Value:= bairro;
    qry.ParamByName('cidade').Value:= cidade;
    qry.ParamByName('uf').Value:= uf;
    qry.Active := true;

    Result:= qry.ToJSONObject;

  finally
    freeandnil(qry);
  end;
end;

function TDm.ClienteEditar(id_cliente: integer;
                            nome, endereco, complemento, bairro, cidade,
                            uf: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Conn;

    qry.SQL.Add('UPDATE clientes SET nome = :nome, endereco = :endereco,');
    qry.SQL.Add('complemento = :complemento, bairro = :bairro, cidade = :cidade, uf = :uf');
    qry.SQL.Add('WHERE id_cliente = :id_cliente');

    qry.ParamByName('id_cliente').Value := id_cliente;
    qry.ParamByName('nome').Value := nome;
    qry.ParamByName('endereco').Value := endereco;
    qry.ParamByName('complemento').Value := complemento;
    qry.ParamByName('bairro').Value := bairro;
    qry.ParamByName('cidade').Value := cidade;
    qry.ParamByName('uf').Value := uf;
    qry.ExecSQL;

    Result := TJSONObject.Create(TJSONPair.Create('id_cliente', id_cliente));

  finally
    FreeAndNil(qry);
  end;
end;



function TDm.ClienteExcluir(id_cliente: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('delete from clientes');
    qry.SQL.Add('where id_cliente = :id_cliente');

    qry.ParamByName('id_cliente').Value:= id_cliente;

    qry.ExecSQL;

    Result:= TJSONOBJECT.Create(tjSONPair.Create('id_cliente',id_cliente));

  finally
    freeandnil(qry);
  end;
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

function TDm.ProdutoListar(filtro:string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('select *');
    qry.SQL.Add('from produto');

    if filtro <> '' then
    begin
      qry.SQL.add('where descricao like :filtro');
      qry.ParamByName('filtro').Value := '%' + filtro + '%';
    end;

    qry.SQL.add('order by descricao');
    qry.Active := true;

    result := qry.ToJSONArray;

  finally
    freeAndNil(qry);
  end;

end;




function TDm.ClienteListarId(id_cliente: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('select *');
    qry.SQL.Add('from clientes');
    qry.SQL.add('where id_cliente = :id_cliente');
    qry.ParamByName('id_cliente').Value :=  id_cliente;
    qry.Active := true;

    result := qry.ToJSonObject;

  finally
    freeAndNil(qry);
  end;



end;


function TDm.usuarioLogin(email,senha: string): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('select id_usuario, nome, email,senha');
    qry.SQL.Add('from usuario');
    qry.SQL.add('where email = :email and senha = :senha');
    qry.ParamByName('email').Value :=  email;
    qry.ParamByName('senha').Value :=  SaltPassWord(senha);
    qry.Active := true;

    result := qry.ToJSonObject;

  finally
    freeAndNil(qry);
  end;



end;


end.
