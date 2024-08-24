
unit Controllers.usuario;

interface

uses
  horse,
  DataModuloGlobal,
  system.JSON,
  System.SysUtils;

  procedure login(Req: THorseRequest; Res: THorseResponse; next: TProc);
  Procedure RegistrarRotas;


implementation

Procedure RegistrarRotas;
begin
    Thorse.Post('/usuarios/login',login);
end;

procedure login(Req: THorseRequest; Res: THorseResponse;
  next: TProc);
var
  Dm: TDm;
  body, json: tjsonObject;
  email, senha : string;
begin

  try
    try
      Dm:= TDm.Create(nil);



      body:= Req.Body<TJSONObject>;
      email := body.GetValue<string>('email','');
      senha:= body.GetValue<string>('senha','');

      json:= Dm.usuarioLogin(email,senha);

      if json.size = 0 then
      begin
        Res.Send('E-mail ou senha inválida').Status(400);

        freeandnil(json);
      end
      else
        res.Send<TJSONObject>(json);

    except on ex:exception do
              res.Send('Ocorreu um erro: ' + ex.Message).Status(500)
    end;

  finally
    freeandnil(Dm);

  end;
end;








end.