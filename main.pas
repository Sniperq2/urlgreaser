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

unit main;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, http_wrapper;

type

  { TMainWindow }

  TMainWindow = class(TForm)
    BtnSend: TButton;
    HTTPMethodField: TComboBox;
    Label1: TLabel;
    URLField: TEdit;
    OutputField: TMemo;
    procedure BtnSendClick(Sender: TObject);
    function GetAllHTMLPage(url: String): AnsiString;
  end;

var
  MainWindow: TMainWindow;

implementation

{$R *.lfm}

{ TMainWindow }

function TMainWindow.GetAllHTMLPage(url: String): AnsiString;
var
  httpWrapper: THttpWrapper;
begin
  httpWrapper := THttpWrapper.Create;
  Result := httpWrapper.Get(url);
   Label1.Caption := IntToStr(httpWrapper.StatusCode());
end;

procedure TMainWindow.BtnSendClick(Sender: TObject);
begin
  if HTTPMethodField.Text = HttpMethodGet then
  begin
      OutputField.Text := GetAllHTMLPage(URLField.Text);
  end;
end;

end.

