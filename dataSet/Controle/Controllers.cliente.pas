unit Controllers.cliente;

interface

uses
  horse,
  DataModuloGlobal,
  system.JSON,
  System.SysUtils;

  procedure Listar(Req: THorseRequest; Res: THorseResponse; next: TProc);
  procedure ListarId(Req: THorseRequest; Res: THorseResponse; next: TProc);
  procedure Inserir(Req: THorseRequest; Res: THorseResponse; next: TProc);
  procedure Editar(Req: THorseRequest; Res: THorseResponse; next: TProc);
  procedure Excluir(Req: THorseRequest; Res: THorseResponse; next: TProc);
  Procedure RegistrarRotas;


implementation

Procedure RegistrarRotas;
begin
    Thorse.Get('/clientes',Listar);
    Thorse.Get('/clientes/:id_cliente',ListarId);
    Thorse.Post('/clientes',Inserir);
    Thorse.Put('/clientes',Editar);
    Thorse.Delete('/clientes',Excluir);
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


procedure ListarId(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
  var
    Dm: Tdm;
    Id_Cliente: Integer;
begin
  try
    try
      Dm:= TDm.Create(nil);

      Id_Cliente := Req.Params['Id_Cliente'].ToInteger;

      Res.Send<Tjsonobject>(Dm.ClienteListarId(Id_Cliente));

    except on ex:exception do
      res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    end;

  finally
    Freeandnil(Dm);
  end;
end;


procedure Inserir(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
var
  Dm: TDm;
  body: tjsonObject;
  nome,endereco,complemento,bairro,cidade, uf : string;
begin

  try
    try
      Dm:= TDm.Create(nil);



      body:= Req.Body<TJSONObject>;
      nome := body.GetValue<string>('nome','');
      endereco:= body.GetValue<string>('endereco','');
      complemento:= body.GetValue<string>('complemento','');
      bairro:= body.GetValue<string>('bairro','');
      cidade:= body.GetValue<string>('cidade','');
      uf := body.GetValue<string>('uf','');

      res.Send<TJSONObject>(Dm.ClienteInserir(nome,endereco,complemento,bairro,cidade,uf)).Status(201);

    except on ex:exception do
              res.Send('Ocorreu um erro: ' + ex.Message).Status(500)
    end;

  finally
    freeandnil(Dm);

  end;

end;

procedure Editar(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
var
  Dm: TDm;
  body: tjsonObject;
  id_cliente: integer;
  nome,endereco,complemento,bairro,cidade, uf : string;
begin

  try
    try

      Dm:= TDm.Create(nil);

      Id_Cliente := Req.Params['Id_Cliente'].ToInteger;

      body:= Req.Body<TJSONObject>;
      nome := body.GetValue<string>('nome','');
      endereco:= body.GetValue<string>('endereco','');
      complemento:= body.GetValue<string>('complemento','');
      bairro:= body.GetValue<string>('bairro','');
      cidade:= body.GetValue<string>('cidade','');
      uf := body.GetValue<string>('uf','');

      res.Send<TJSONObject>(Dm.ClienteEditar(Id_Cliente,nome,endereco,complemento,bairro,cidade,uf));

    except on ex:exception do
              res.Send('Ocorreu um erro: ' + ex.Message).Status(500)
    end;

  finally
    freeandnil(Dm);

  end;
end;

procedure Excluir(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
var
  Dm: TDm;
  id_cliente: integer;
begin

  try
    try

      Dm:= TDm.Create(nil);

      Id_Cliente := Req.Params['Id_Cliente'].ToInteger;

      res.Send<TJSONObject>(Dm.ClienteExcluir(Id_Cliente));

    except on ex:exception do
              res.Send('Ocorreu um erro: ' + ex.Message).Status(500)
    end;

  finally
    freeandnil(Dm);

  end;
end;

end.
