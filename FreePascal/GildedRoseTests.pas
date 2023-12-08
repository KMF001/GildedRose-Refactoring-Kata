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

  TTestGuildedRose = class(TTestCase)
  private
    LItems: specialize TFPGObjectList<TItem>;
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
//  Fail('Write your own test');
  LItems := specialize TFPGObjectList<TItem>.Create;

  LGildedRose.UpdateQuality;

  AssertEquals('fixme', LGildedRose.Items[0].Name);

end;

procedure TTestGuildedRose.SetUp;
begin
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
