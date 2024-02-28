{*******************************************************************************}
{ Projeto: Gerador de API                                                       }
{                                                                               }
{ O objetivo da aplicação é facilitar a criação de Interface, model e controller}
{ para Insert, Update, Delete e Select a partir de tabelas do banco de dados    }
{ (Postgres ou Firebird), respeitando a tipagem, PK e FK                        }
{*******************************************************************************}
{                                                                               }
{ Desenvolvido por JANDERSON APARECIDO DA SILVA                                 }
{ Email: janderson_rm@hotmail.com                                               }
{                                                                               }
{*******************************************************************************}



unit model.pessoa;

interface

uses
  Horse,
  Data.DB,
  FireDAC.Comp.Client,
  System.SysUtils,
  interfaces.pessoa,
  model.connection;

type
  TPessoa = class(TInterfacedObject, iPessoa)
    private
      Fcodigo : Integer;
      Fnome : string;
      Fapelido : string;
      Fcpf : string;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPessoa;

      function codigo (Value : Integer) : iPessoa; overload;
      function codigo : Integer; overload;

      function nome (Value : string) : iPessoa; overload;
      function nome : string; overload;

      function apelido (Value : string) : iPessoa; overload;
      function apelido : string; overload;

      function cpf (Value : string) : iPessoa; overload;
      function cpf : string; overload;

      function Select(order_by: string; out erro : string) : TFDquery; overload;
      function Insert(out erro : String) : iPessoa; overload;
      function Update(out erro : String) : iPessoa; overload;
      function Delete(out erro : String) : iPessoa; overload;

      function &End : iPessoa;

  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  model.connection.Connect;
end;

destructor TPessoa.Destroy;
begin
  model.connection.Disconect;
end;

class function TPessoa.New: iPessoa;
begin
  Result := Self.Create;
end;

function TPessoa.&End: iPessoa;
begin
  Result := Self;
end;

function TPessoa.Select(order_by: string; out erro: string): TFDquery;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;
    qry.Active := False;
    qry.sql.Clear;
    qry.sql.Add('select *');
    qry.sql.Add('from PESSOA');
    qry.sql.Add('where 1 = 1');

    if Fcodigo > 0 then
    begin
      qry.SQL.Add('and codigo = :codigo');
      qry.ParamByName('codigo').Value := Fcodigo;
    end;
    if Trim(Fnome) <> '' then
    begin
      qry.SQL.Add('and nome = :nome');
      qry.ParamByName('nome').Value := Fnome;
    end;
    if Trim(Fapelido) <> '' then
    begin
      qry.SQL.Add('and apelido = :apelido');
      qry.ParamByName('apelido').Value := Fapelido;
    end;
    if Trim(Fcpf) <> '' then
    begin
      qry.SQL.Add('and cpf = :cpf');
      qry.ParamByName('cpf').Value := Fcpf;
    end;

    if Trim(order_by) <> '' then
      qry.sql.Add('order by ' + order_by);

    qry.Active := True;
    erro := '';
    Result := qry;
  except on ex:exception do
    begin
      erro := 'Erro ao consultar PESSOA: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

function TPessoa.Insert(out erro: String): iPessoa;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;
    qry.Active := False;
    qry.sql.Clear;
    qry.sql.Add('insert into PESSOA(');
    qry.SQL.Add('    nome,');
    qry.SQL.Add('    apelido,');
    qry.SQL.Add('    cpf');
    qry.SQL.Add(') values (');
    qry.SQL.Add('    :nome,');
    qry.SQL.Add('    :apelido,');
    qry.SQL.Add('    :cpf');
    qry.SQL.Add(')');
    qry.ParamByName('nome').Value := Fnome;
    qry.ParamByName('apelido').Value := Fapelido;
    qry.ParamByName('cpf').Value := Fcpf;
    qry.ExecSQL;
    qry.Free;
    erro := '';
  except on ex:exception do
    begin
      erro := 'Erro ao inserir PESSOA: ' + ex.Message;
    end;
  end;
end;

function TPessoa.Update(out erro: String): iPessoa;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;
    qry.Active := False;
    qry.sql.Clear;
    qry.sql.Add('update PESSOA set');
    qry.SQL.Add('    nome = :nome,');
    qry.SQL.Add('    apelido = :apelido,');
    qry.SQL.Add('    cpf = :cpf');
    qry.sql.Add('where 1 = 1');
    qry.SQL.Add('and codigo = :codigo');
    qry.ParamByName('codigo').Value := Fcodigo;
    qry.ParamByName('nome').Value := Fnome;
    qry.ParamByName('apelido').Value := Fapelido;
    qry.ParamByName('cpf').Value := Fcpf;
    qry.ExecSQL;
    qry.Free;
    erro := '';
  except on ex:exception do
    begin
      erro := 'Erro ao atualizar PESSOA: ' + ex.Message;
    end;
  end;
end;

function TPessoa.Delete(out erro: String): iPessoa;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := Model.Connection.FConnection;
    qry.Active := False;
    qry.sql.Clear;
    qry.sql.Add('delete from PESSOA');
    qry.sql.Add('where 1 = 1');
    qry.SQL.Add('and codigo = :codigo');
    qry.ParamByName('codigo').Value := Fcodigo;
    qry.ExecSQL;
    qry.Free;
    erro := '';
  except on ex:exception do
    begin
      erro := 'Erro ao deletar PESSOA: ' + ex.Message;
    end;
  end;
end;

function TPessoa.codigo (Value : Integer) : iPessoa;
begin
  Result := Self;
  Fcodigo := Value;
end;

function TPessoa.codigo : Integer;
begin
  Result := Fcodigo;
end;

function TPessoa.nome (Value : string) : iPessoa;
begin
  Result := Self;
  Fnome := Value;
end;

function TPessoa.nome : string;
begin
  Result := Fnome;
end;

function TPessoa.apelido (Value : string) : iPessoa;
begin
  Result := Self;
  Fapelido := Value;
end;

function TPessoa.apelido : string;
begin
  Result := Fapelido;
end;

function TPessoa.cpf (Value : string) : iPessoa;
begin
  Result := Self;
  Fcpf := Value;
end;

function TPessoa.cpf : string;
begin
  Result := Fcpf;
end;

end.
