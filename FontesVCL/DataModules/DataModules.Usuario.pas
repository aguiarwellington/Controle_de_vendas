unit DataModules.Usuario;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  Data.DB,
  FireDAC.Comp.DataSet,
  DataSet.Serialize.Config,

  RESTRequest4D,
  DataSet.Serialize.adapter.RESTRequest4D,
  FireDAC.Comp.Client;

type
  TDmUsuario = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Login(memtable: TFDMemTable; email, senha: string);
  end;

var
  DmUsuario: TDmUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}






{$R *.dfm}



procedure TDmUsuario.DataModuleCreate(Sender: TObject);
begin
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
  TDataSetSerializeConfig.GetInstance.Import.DecimalSeparator:= '.';
end;

procedure TDmUsuario.Login(memtable: TFDMemTable; email, senha: string);
var
  resp: IResponse;
  json:TJsonObject;
begin


  try
    json:= TJsonObject.create;
    json.AddPair('email',email);
    json.AddPair('senha',senha);


    resp:= TRequest.new.baseURL('http://localhost:3000')
                        .Resource('/usuarios/login')
                        .AddBody(json.ToJSON)
                        .accept('application/json')
                        .Adapters(TdatasetSerializeadapter.New(memtable))
                        .Post;

    if resp.StatusCode <> 200 then
      raise exception.Create(resp.Content);




  finally
    freeandnil(json);
  end;

end;

end.
