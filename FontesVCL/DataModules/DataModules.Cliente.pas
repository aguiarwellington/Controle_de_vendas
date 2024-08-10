unit DataModules.Cliente;

interface

uses
  System.SysUtils, System.Classes;

type
  TDMCliente = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCliente: TDMCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
