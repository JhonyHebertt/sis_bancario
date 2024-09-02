unit uRelConsolidado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, dmconexao,
  Vcl.Imaging.pngimage;

type
  TfRelConsolidado = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    sld_ant: TRLDBText;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText7: TRLDBText;
    RLImage1: TRLImage;
    RLBand5: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelConsolidado: TfRelConsolidado;

implementation

{$R *.dfm}

end.
