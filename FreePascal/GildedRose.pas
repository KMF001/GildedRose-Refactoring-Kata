unit GildedRose;

{$MODE Delphi}

interface

uses
  fgl,{System.Generics.Collections}
  Item;

type
  TGildedRose = class(TObject)
  private
    FItems: TFPGObjectList<TItem>;
  public
    constructor Create(const AItems: TFPGObjectList<TItem>);
    procedure UpdateQuality;
    property Items: TFPGObjectList<TItem> read FItems;
  end;

implementation

{ TGildedRose }

constructor TGildedRose.Create(const AItems: TFPGObjectList<TItem>);
begin
  inherited Create;
  FItems := AItems;
end;

procedure TGildedRose.UpdateQuality;
var
  I: Integer;
begin
  for I := 0 to Items.Count - 1 do
  begin
    if (Items[I].Name <> 'Aged Brie') and (Items[I].Name <> 'Backstage passes to a TAFKAL80ETC concert') then
    begin
      if Items[I].Quality > 0 then
      begin
        if Items[I].Name <> 'Sulfuras, Hand of Ragnaros' then
        begin
          Items[I].Quality := Items[I].Quality - 1;
        end;
      end;
    end
    else
    begin
      if Items[I].Quality < 50 then
      begin
        Items[I].Quality := Items[I].Quality + 1;
        if Items[I].Name = 'Backstage passes to a TAFKAL80ETC concert' then
        begin
          if Items[I].SellIn < 11 then
          begin
            if Items[I].Quality < 50 then
            begin
              Items[I].Quality := Items[I].Quality + 1;
            end;
          end;

          if Items[I].SellIn < 6 then
          begin
            if Items[I].Quality < 50 then
            begin
              Items[I].Quality := Items[I].Quality + 1;
            end;
          end;
        end;
      end;
    end;

    if Items[I].Name <> 'Sulfuras, Hand of Ragnaros' then
    begin
      Items[I].SellIn := Items[I].SellIn - 1;
    end;

    if Items[I].SellIn < 0 then
    begin
      if Items[I].Name <> 'Aged Brie' then
      begin
        if Items[I].Name <> 'Backstage passes to a TAFKAL80ETC concert' then
        begin
          if Items[I].Quality > 0 then
          begin
            if Items[I].Name <> 'Sulfuras, Hand of Ragnaros' then
            begin
              Items[I].Quality := Items[I].Quality - 1;
            end;
          end;
        end
        else
        begin
          Items[I].Quality := Items[I].Quality - Items[I].Quality;
        end;
      end
      else
      begin
        if Items[I].Quality < 50 then
        begin
          Items[I].Quality := Items[I].Quality + 1;
        end;
      end;
    end;
  end;
end;

end.
