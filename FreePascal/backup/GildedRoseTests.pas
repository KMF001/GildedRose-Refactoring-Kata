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
  Item,
  GildedRose;

type

  TTestCaseGC = class(TTestCase)
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

procedure TTestCaseGC.TestHookUp;
var
begin
  Fail('Write your own test');

  LGildedRose.UpdateQuality;

  Assert.AreEqual('fixme', LGildedRose.Items[0].Name);

end;

procedure TTestCaseGC.SetUp;
begin
  LItems := TFPGObjectList<TItem>.Create;
  LItems.Add(TItem.Create('foo', 0, 0));
  LGildedRose := TGildedRose.Create(LItems);
end;

procedure TTestCaseGC.TearDown;
begin
  LGildedRose.Free;
end;

initialization

  RegisterTest(TTestCaseGC);
end.
