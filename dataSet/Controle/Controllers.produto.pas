
unit Controllers.produto;

interface

uses
  horse,
  DataModuloGlobal,
  system.JSON,
  System.SysUtils;

  procedure Listar(Req: THorseRequest; Res: THorseResponse; next: TProc);
  Procedure RegistrarRotas;


implementation

Procedure RegistrarRotas;
begin
    Thorse.Get('/produtos',Listar);
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
  var
    Dm: Tdm;
    filtro: string;
begin
  try
    try
      Dm:= TDm.Create(nil);

      filtro:= Req.Query['filtro'];

      Res.Send<TJsonArray>(Dm.ProdutoListar(filtro));

    except on ex:exception do
      res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    end;

  finally
    Freeandnil(Dm);
  end;
end;








end.