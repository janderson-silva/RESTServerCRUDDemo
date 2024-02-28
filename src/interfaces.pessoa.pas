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



unit interfaces.pessoa;

interface

uses
  Horse,
  Data.DB,
  FireDAC.Comp.Client;

type
  iPessoa = interface
    function codigo (Value : Integer) : iPessoa; overload;
    function codigo : Integer; overload;

    function nome (Value : String) : iPessoa; overload;
    function nome : String; overload;

    function apelido (Value : String) : iPessoa; overload;
    function apelido : String; overload;

    function cpf (Value : String) : iPessoa; overload;
    function cpf : String; overload;

    function Select(order_by: string; out erro : string) : TFDquery; overload;
    function Insert(out erro : String) : iPessoa; overload;
    function Update(out erro : String) : iPessoa; overload;
    function Delete(out erro : String) : iPessoa; overload;

    function &End : iPessoa;

  end;

implementation

end.
