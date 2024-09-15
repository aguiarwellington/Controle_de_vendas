unit Controllers.Pedidos;

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
    Thorse.Get('/Pedidos',Listar);
    Thorse.Get('/Pedidos/:id_Pedido',ListarId);
    Thorse.Post('/Pedidos',Inserir);
    Thorse.Put('/Pedidos/:id_Pedido',Editar);
    Thorse.Delete('/Pedidos/:id_Pedido',Excluir);
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

      Res.Send<TJsonArray>(Dm.PedidoListar(filtro));

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
    Id_pedido: Integer;
begin
  try
    try
      Dm:= TDm.Create(nil);

      Id_pedido := Req.Params['Id_pedido'].ToInteger;

      Res.Send<Tjsonobject>(Dm.pedidoListarId(Id_pedido));

    except on ex:exception do
      res.Send('Ocorreu um erro: ' + ex.Message).Status(500);

    end;

  finally
    Freeandnil(Dm);
  end;
end;


procedure Inserir(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  bodyStr: string;
  body: TJSONObject;
  id_usuario, id_cliente: integer;
  dt_pedido: string;
  vl_total: double;
  itens: TJSONArray;
  Dm: TDm;
  RetornoJson: TJSONObject;
begin
  try
    // Verificar se o corpo da solicitação não está vazio
    bodyStr := Req.Body;
    Dm := TDm.Create(nil);


    if bodyStr = '' then
    begin
      Res.Status(THTTPStatus.BadRequest).Send('Request body is empty');
      Exit;
    end;

    // Inicializar o objeto JSON a partir do corpo da solicitação
    try
      body := TJSONObject.ParseJSONValue(bodyStr) as TJSONObject;
    except
      on E: Exception do
      begin
        Writeln('Erro ao parsear JSON: ', E.Message);
        Res.Status(THTTPStatus.BadRequest).Send('Invalid JSON format');
        Exit;
      end;
    end;

    if body = nil then
    begin
      Writeln('Erro: JSON inválido.');
      Res.Status(THTTPStatus.BadRequest).Send('Invalid JSON format');
      Exit;
    end;

    // Pegando os valores do JSON
    id_usuario := body.GetValue<integer>('id_usuario', 0);
    id_cliente := body.GetValue<integer>('id_cliente', 0);
    dt_pedido := body.GetValue<string>('dt_pedido', '');
    vl_total := body.GetValue<double>('vl_total', 0);
    itens := body.GetValue<TJSONArray>('itens');


    RetornoJson := Dm.PedidoInserir(id_usuario, id_cliente, dt_pedido, vl_total, itens);
    FreeAndNil(Dm);

  except
    on E: Exception do
    begin
      Writeln('Erro ao processar POST /pedidos: ', E.Message);
      Res.Status(THTTPStatus.InternalServerError).Send(E.Message);
    end;
  end;
end;

procedure Editar(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
var
  Dm: TDm;
  body: tjsonObject;
  id_pedido,id_cliente: integer;
  dt_pedido: string;
  vl_total: double;
  itens: TJSONArray;

  bodyStr: string;
begin

  try
    try

      // Verificar se o corpo da solicitação não está vazio
      bodyStr := Req.Body;
      Dm := TDm.Create(nil);


      if bodyStr = '' then
      begin
        Res.Status(THTTPStatus.BadRequest).Send('Request body is empty');
        Exit;
      end;

      // Inicializar o objeto JSON a partir do corpo da solicitação
      try
        body := TJSONObject.ParseJSONValue(bodyStr) as TJSONObject;
      except
        on E: Exception do
        begin
          Writeln('Erro ao parsear JSON: ', E.Message);
          Res.Status(THTTPStatus.BadRequest).Send('Invalid JSON format');
          Exit;
        end;
      end;

      if body = nil then
      begin
        Writeln('Erro: JSON inválido.');
        Res.Status(THTTPStatus.BadRequest).Send('Invalid JSON format');
        Exit;
      end;



      // Http://localhost:3000/pedidos/10
      //corpo: dados do pedido

      id_pedido := Req.Params['id_pedido'].ToInteger;

      body:= Req.Body<TJSONObject>;

      id_cliente:= body.GetValue<integer>('id_cliente',0);
      dt_pedido:= body.GetValue<string>('dt_pedido','');
      vl_total:= body.GetValue<double>('vl_total',0);
      itens:= body.GetValue<tjsonArray>('itens');

      res.Send<TJSONObject>(Dm.PedidoEditar(id_pedido,id_cliente,dt_pedido,vl_total,itens));

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
  id_pedido: integer;
begin

  try
    try

      Dm:= TDm.Create(nil);

      id_pedido := Req.Params['id_pedido'].ToInteger;

      res.Send<TJSONObject>(Dm.PedidoExcluir(id_pedido));

    except on ex:exception do
              res.Send('Ocorreu um erro: ' + ex.Message).Status(500)
    end;

  finally
    freeandnil(Dm);

  end;
end;

end.
