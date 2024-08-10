unit Controllers.cliente;

interface

uses
  horse,
  DataModuloGlobal,
  system.JSON,
  System.SysUtils;

  procedure Listar(Req: THorseRequest; Res: THorseResponse; next: TProc);
  procedure Inserir(Req: THorseRequest; Res: THorseResponse; next: TProc);
  procedure Editar(Req: THorseRequest; Res: THorseResponse; next: TProc);
  procedure Excluir(Req: THorseRequest; Res: THorseResponse; next: TProc);
  Procedure RegistrarRotas;


implementation

Procedure RegistrarRotas;
begin
    Thorse.Get('/clientes',Listar);
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

      Res.Send<TJsonArray>(Dm.ClienteListar(filtro));

    except on ex:exception do
      res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    end;

  finally
    Freeandnil(Dm);
  end;
end;


procedure Inserir(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
begin
  Res.Send('Inserir de clientes').Status(201);
end;

procedure Editar(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
begin
  Res.Send('Editar de clientes').Status(200);
end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
begin
  Res.Send('Excluir de clientes').Status(200);
end;

end.
