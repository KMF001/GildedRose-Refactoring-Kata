unit Item;

{$MODE Delphi}

interface

type
  TItem = class(TObject)
  private
    FName: string;
    FSellIn: integer;
    FQuality: integer;
  public
    constructor Create(const AName: string; const ASellIn, AQuality: integer);
    function ToString: string; override;
    property Name: string read FName write FName;
    property SellIn: integer read FSellIn write FSellIn;
    property Quality: integer read FQuality write FQuality;
  end;

implementation

uses
  SysUtils;

{ TItem }

constructor TItem.Create(const AName: string; const ASellIn, AQuality: integer);
begin
  inherited Create;
  FName := AName;
  FSellIn := ASellIn;
  FQuality := AQuality;
end;

function TItem.ToString: string;
begin
  Result := Format('%s, %d, %d', [Name, SellIn, Quality]);
end;

end.
