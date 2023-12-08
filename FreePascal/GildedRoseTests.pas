unit GildedRoseTests;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  fpcunit,
  testutils,
  testregistry,
  fgl,
  GildedRose,
  Item;

type
  TMyList = specialize TFPGObjectList<TItem>;
  TTestGuildedRose = class(TTestCase)
  private
    LItems: TMyList;
    LGildedRose: TGildedRose;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestHookUp;
  end;

implementation

procedure TTestGuildedRose.TestHookUp;
begin
  LGildedRose.UpdateQuality;
  AssertEquals('fixme', LGildedRose.Items[0].Name);
end;

procedure TTestGuildedRose.SetUp;
begin
  LItems := TMyList.Create;
  LItems.Add(TItem.Create('foo', 0, 0));
  LGildedRose := TGildedRose.Create(LItems);
end;

procedure TTestGuildedRose.TearDown;
begin
  LGildedRose.Free;
end;

initialization

  RegisterTest(TTestGuildedRose);
end.
