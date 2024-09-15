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

    function pedidoEditar(id_pedido, id_cliente: integer; dt_pedido: string;
      vl_total: double;itens:tjsonArray): TJsonObject;
    function PedidoExcluir(id_pedido: integer): TJsonObject;
    function PedidoInserir(id_cliente,id_usuario: integer; dt_pedido: string;
      vl_total: double;  itens: TJSONArray): TJsonObject;

    function pedidoListar(filtro: string): TJsonArray;
    function PedidoListarId(id_pedido: integer): TJsonObject;
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

    qry.SQL.Add('insert into cliente(nome,endereco,complemento,bairro,cidade,uf)');
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

    qry.SQL.Add('UPDATE cliente SET nome = :nome, endereco = :endereco,');
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

    qry.SQL.Add('delete from cliente');
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
    qry.SQL.Add('from cliente');

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
    qry.SQL.Add('from cliente');
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

function TDm.PedidoListarId(id_pedido: integer): TJsonObject;
var
  qryPedido, qryItens: TFDQuery;
begin
  try
    qryPedido := TFDQuery.Create(nil);
    qryPedido.Connection := Conn;

    qryPedido.SQL.Add('select p.*, c.nome, c.cidade, u.nome as usuario');
    qryPedido.SQL.Add('from pedido as p');
    qryPedido.SQL.Add('join cliente c on (c.id_cliente = p.id_cliente)');
    qryPedido.SQL.Add('join usuario u on (u.id_usuario = p.id_usuario)');
    qryPedido.SQL.Add('where p.id_pedido = :id_pedido');

    qryPedido.ParamByName('id_pedido').Value := id_pedido;
    qryPedido.Open;

    result := qryPedido.ToJSONObject;

    // Agora cria uma nova query para os itens do pedido
    qryItens := TFDQuery.Create(nil);
    qryItens.Connection := Conn;

    qryItens.SQL.Add('select i.id_item, i.id_produto, p.descricao, i.qtd, i.vl_unitario, i.vl_total');
    qryItens.SQL.Add('from pedido_item as i');
    qryItens.SQL.Add('join produto p on (p.id_produto = i.id_produto)');
    qryItens.SQL.Add('where i.id_pedido = :id_pedido');

    qryItens.ParamByName('id_pedido').Value := id_pedido;
    qryItens.Open;

    // Adiciona o array de itens no JSON do pedido
    result.AddPair('itens', qryItens.ToJSONArray);

  finally
    freeAndNil(qryPedido);
    freeAndNil(qryItens);
  end;
end;



function TDm.PedidoInserir( id_cliente,id_usuario: integer;
                            dt_pedido: string;
                            vl_total: double;
                            itens: TJSONArray): TJsonObject;
var
  qry: TFDQuery;
  id_pedido: integer;
  i: integer;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('insert into pedido(id_usuario,id_cliente,dt_pedido,vl_total)');
    qry.SQL.Add('values(:id_usuario, :id_cliente, :dt_pedido, :vl_total);');
    qry.SQL.Add('select last_insert_rowid() as id_pedido');

    qry.ParamByName('id_usuario').Value:= id_usuario;
    qry.ParamByName('id_cliente').Value:= id_cliente;
    qry.ParamByName('dt_pedido').Value:= dt_pedido;
    qry.ParamByName('vl_total').Value:= vl_total;

    qry.Active := true;

    id_pedido := qry.FieldByName('id_pedido').AsInteger;

    //itens
    for i := 0 to itens.size -1 do
    begin
      qry.sql.clear;
      qry.SQL.Add('insert into pedido_item(id_pedido,id_produto,qtd,vl_unitario,vl_total)');
      qry.SQL.Add('values(:id_pedido, :id_produto, :qtd, :vl_unitario,:vl_total);');

      qry.ParamByName('id_pedido').Value:= id_pedido;
      qry.ParamByName('id_produto').Value:= itens[i].GetValue<integer>('id_produto',0);
      qry.ParamByName('qtd').Value:= itens[i].GetValue<integer>('qtd',0);
      qry.ParamByName('vl_unitario').Value:= itens[i].GetValue<integer>('vl_unitario',0);
      qry.ParamByName('vl_total').Value:= itens[i].GetValue<integer>('vl_total',0);

      qry.execSQL;
    end;

    Result:= TJSONOBject.Create(tjsonPair.Create('id_pedido', id_pedido)); //{"id_pedido": 123}

  finally
    freeandnil(qry);
  end;
end;

function TDm.pedidoEditar(id_pedido,id_cliente: integer;
                          dt_pedido: string;
                          vl_total: double;
                          itens:tjsonArray): TJsonObject;
var
  qry: TFDQuery;
  i: integer;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Conn;

    qry.SQL.Add('UPDATE pedido SET id_pedido = :id_pedido, id_cliente = :id_cliente,');
    qry.SQL.Add('dt_pedido = :dt_pedido, vl_total = :vl_total');
    qry.SQL.Add('WHERE id_pedido = :id_pedido');

    qry.ParamByName('id_pedido').Value := id_pedido;
    qry.ParamByName('id_cliente').Value := id_cliente;
    qry.ParamByName('dt_pedido').Value := dt_pedido;  //yyyy-mm-dd
    qry.ParamByName('vl_total').Value := vl_total;

    qry.ExecSQL;

    qry.sql.clear;
    qry.SQL.Add('delete from pedido_item');
    qry.SQL.Add('WHERE id_pedido = :id_pedido');

    qry.ParamByName('id_pedido').Value := id_pedido;

    qry.ExecSQL;

    //itens
    for i := 0 to itens.size -1 do
    begin
      qry.sql.clear;
      qry.SQL.Add('insert into pedido_item(id_pedido,id_produto,qtd,vl_unitario,vl_total)');
      qry.SQL.Add('values(:id_pedido, :id_produto, :qtd, :vl_unitario,:vl_total);');

      qry.ParamByName('id_pedido').Value:= id_pedido;
      qry.ParamByName('id_produto').Value:= itens[i].GetValue<integer>('id_produto',0);
      qry.ParamByName('qtd').Value:= itens[i].GetValue<integer>('qtd',0);
      qry.ParamByName('vl_unitario').Value:= itens[i].GetValue<integer>('vl_unitario',0);
      qry.ParamByName('vl_total').Value:= itens[i].GetValue<integer>('vl_total',0);

      qry.execSQL;

    end;

    Result:= TJSONOBject.Create(tjsonPair.Create('ID_pedido', id_pedido));

  finally
    FreeAndNil(qry);
  end;
end;



function TDm.PedidoExcluir(id_pedido: integer): TJsonObject;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('delete from pedido_item');
    qry.SQL.Add('where id_pedido = :id_pedido');
    qry.ParamByName('id_pedido').Value:= id_pedido;
    qry.ExecSQL;

    qry.SQL.Clear;
    qry.SQL.Add('delete from pedido');
    qry.SQL.Add('where id_pedido = :id_pedido');
    qry.ParamByName('id_pedido').Value:= id_pedido;
    qry.ExecSQL;

    Result:= TJSONOBJECT.Create(tjSONPair.Create('id_pedido',id_pedido));

  finally
    freeandnil(qry);
  end;
end;



function TDm.pedidoListar(filtro:string): TJsonArray;
var
  qry: TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection:= Conn;

    qry.SQL.Add('select p.*, c.nome, c.cidade, u.nome as usuario');
    qry.SQL.Add('from pedido as p');
    qry.SQL.Add('join cliente c on (c.id_cliente = p.id_cliente)');
    qry.SQL.Add('join usuario u on (u.id_usuario = p.id_usuario)');

    if filtro <> '' then
    begin
      qry.SQL.add('where c.nome like :filtro');
      qry.ParamByName('filtro').Value := '%' + filtro + '%';
    end;

    qry.SQL.add('order by p.id_pedido desc');
    qry.Active := true;

    result := qry.ToJSONArray;

  finally
    freeAndNil(qry);
  end;

end;




end.
