unit DataModules.Pedido;

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
  TDmPedido = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ListarPedido(memtable: TFDMemTable; filtro:string);
     procedure ListarPedidoId(memtable: TFDMemTable; id_pedido: integer);
  end;

var
  DmPedido: TDmPedido;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPedido }

procedure TDmPedido.ListarPedido(memtable: TFDMemTable; filtro: string);
var
  resp: IResponse;
begin
   resp:= TRequest.new.baseURL('http://localhost:3000')
                      .Resource('/Pedidos')
                      .AddParam('filtro', filtro)
                      .accept('application/json')
                      .Adapters(TdatasetSerializeadapter.New(memtable))
                      .Get;

   if resp.StatusCode <> 200 then
    raise exception.Create(resp.Content);
end;

procedure TDmPedido.ListarPedidoId(memtable: TFDMemTable; id_pedido: integer);
var
  resp: IResponse;
begin
   resp:= TRequest.new.baseURL('http://localhost:3000')
                      .Resource('/pedidos')
                      .ResourceSuffix(id_pedido.ToString)
                      .accept('application/json')
                      .Adapters(TdatasetSerializeadapter.New(memtable))
                      .Get;

   if resp.StatusCode <> 200 then
    raise exception.Create(resp.Content);
end;

end.
