(*
 * Copyright (C) Sniperq2
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *)

unit http_wrapper;
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fgl, fphttpclient;

const
  HttpMethodGet = 'GET';

type
  IHTTPWrapper = Interface
    function Get(url: string): String;
  end;

  THTTPWrapper = Class(TInterfacedObject, IHTTPWrapper)
  private
    FUrl: String;
    HTTPWrapper: TFPHTTPClient;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetUrl(url: string);
    function Get(url: string): String;
    function StatusCode(): LongInt;
  published
    property Url: String read FUrl write SetUrl;
  end;

implementation

constructor THTTPWrapper.Create;
begin
  HTTPWrapper := TFPHTTPClient.Create(nil);
end;

function THTTPWrapper.Get(url: string): String;
begin
  Result := HTTPWrapper.Get(url);
end;

function THTTPWrapper.StatusCode(): LongInt;
begin
  Result := HTTPWrapper.ResponseStatusCode;
end;

procedure THTTPWrapper.SetUrl(url: string);
begin
  FUrl := url;
end;

destructor THTTPWrapper.Destroy;
begin
  FreeAndNil(HTTPWrapper);
end;

end.

