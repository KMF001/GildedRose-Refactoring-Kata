program UnitTests;

{$mode objfpc}{$H+}

uses
  Classes, consoletestrunner, GildedRoseTests, GildedRose, Item;

type

  { TMyTestRunner }

  TMyTestRunner = class(TTestRunner)
  protected
  // override the protected methods of TTestRunner to customize its behavior
  end;

var
  Application: TMyTestRunner;

begin
  Application := TMyTestRunner.Create(nil);
  Application.Initialize;
  Application.Title := 'FPCUnit Guilded Rose Console test runner';
  Application.Run;
  Application.Free;
end.
