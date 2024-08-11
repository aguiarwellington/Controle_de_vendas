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



end.
