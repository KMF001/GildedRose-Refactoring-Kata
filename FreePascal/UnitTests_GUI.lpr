program UnitTests_GUI;

{$mode objfpc}{$H+}

uses
  Interfaces,
  Forms,
  GuiTestRunner,
  GildedRoseTests,
  Item,
  GildedRose;

{$R *.res}

begin
  Application.Title := 'project1';
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.Run;
end.
