unit uRelAnalitico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, dmConexao,
  Vcl.Imaging.pngimage;

type
  TfRelAnalitico = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel5: TRLLabel;
    RLDBText4: TRLDBText;
    RLImage1: TRLImage;
    RLLabel2: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    RLDBResult1: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelAnalitico: TfRelAnalitico;

implementation

{$R *.dfm}

end.
