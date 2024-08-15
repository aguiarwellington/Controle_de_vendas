unit DataModules.Cliente;

interface

uses
  System.SysUtils,
  System.Classes,
  DataSet.Serialize.Config,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  system.JSON,

  RESTRequest4D,
  DataSet.Serialize.adapter.RESTRequest4D,
  FireDAC.Comp.Client;

type
  TDMCliente = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ListarCliente(memtable: TFDMemTable; filtro:string);
     procedure ListarClienteId(memtable: TFDMemTable; id_cliente: integer);
     procedure Inserir(nome, endereco, complemento, bairro, cidade, uf: string);
     procedure editar(id_Cliente: integer; nome, endereco, complemento, bairro,
      cidade, uf: string);
     procedure excluir(id_Cliente: integer);
  end;

var
  DMCliente: TDMCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMCliente.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator:= '.';
end;


procedure TDMCliente.ListarCliente(memtable: TFDMemTable;
                                    filtro:string);
var
  resp: IResponse;
begin
   resp:= TRequest.new.baseURL('http://localhost:3000')
                      .Resource('/clientes')
                      .AddParam('filtro', filtro)
                      .accept('application/json')
                      .Adapters(TdatasetSerializeadapter.New(memtable))
                      .Get;

   if resp.StatusCode <> 200 then
    raise exception.Create(resp.Content);

end;


procedure TDMCliente.ListarClienteId(memtable: TFDMemTable;
                                    id_cliente: integer);
var
  resp: IResponse;
begin
   resp:= TRequest.new.baseURL('http://localhost:3000')
                      .Resource('/clientes')
                      .ResourceSuffix(id_cliente.ToString)
                      .accept('application/json')
                      .Adapters(TdatasetSerializeadapter.New(memtable))
                      .Get;

   if resp.StatusCode <> 200 then
    raise exception.Create(resp.Content);

end;

procedure TDMCliente.Inserir(nome,endereco,complemento,bairro,cidade,uf: string);
var
  resp: IResponse;
  json:TJsonObject;
begin


  try
    json:= TJsonObject.create;
    json.AddPair('nome',nome);
    json.AddPair('endereco',endereco);
    json.AddPair('complemento',complemento);
    json.AddPair('bairro',bairro);
    json.AddPair('cidade',cidade);
    json.AddPair('uf',uf);



    resp:= TRequest.new.baseURL('http://localhost:3000')
                        .Resource('/clientes')
                        .AddBody(json.ToJSON)
                        .accept('application/json')
                        .Post;

    if resp.StatusCode <> 201 then
      raise exception.Create(resp.Content);




  finally
    freeandnil(json);
  end;

end;

procedure TDMCliente.editar(id_Cliente: integer;
                            nome,endereco,complemento,bairro,cidade,uf: string);
var
  resp: IResponse;
  json:TJsonObject;
begin


  try
    json:= TJsonObject.create;
    json.AddPair('nome',nome);
    json.AddPair('endereco',endereco);
    json.AddPair('complemento',complemento);
    json.AddPair('bairro',bairro);
    json.AddPair('cidade',cidade);
    json.AddPair('uf',uf);



    resp:= TRequest.new.baseURL('http://localhost:3000')
                        .Resource('/clientes')
                        .ResourceSuffix(id_cliente.ToString)
                        .AddBody(json.ToJSON)
                        .accept('application/json')
                        .Put;

    if resp.StatusCode <> 200 then
      raise exception.Create(resp.Content);

  finally
    freeandnil(json);
  end;

end;

procedure TDMCliente.excluir(id_Cliente: integer);
var
  resp: IResponse;
begin

    resp:= TRequest.new.baseURL('http://localhost:3000')
                        .Resource('/clientes')
                        .ResourceSuffix(id_cliente.ToString)
                        .Accept('application/json')
                        .Delete;

    if resp.StatusCode <> 200 then
      raise exception.Create(resp.Content);

end;



end.
