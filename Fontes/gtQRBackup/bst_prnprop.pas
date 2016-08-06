unit bst_prnprop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  Tfrm_prnProp = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cmb_borda: TComboBox;
    Edit4: TEdit;
    tbmi: TTrackBar;
    tbms: TTrackBar;
    Edit5: TEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    tbme: TTrackBar;
    tbmd: TTrackBar;
    Label6: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    Edit6: TEdit;
    tbcab: TTrackBar;
    tbrod: TTrackBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_bordaCloseUp(Sender: TObject);
    procedure tbmeChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tbmdChange(Sender: TObject);
    procedure tbmsChange(Sender: TObject);
    procedure tbmiChange(Sender: TObject);
    procedure tbrodChange(Sender: TObject);
    procedure tbcabChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_prnProp: Tfrm_prnProp;

implementation

uses bst_prnf;

{$R *.dfm}

procedure Tfrm_prnProp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
frm_prnprop := nil;
action := caFree;
end;



procedure Tfrm_prnProp.cmb_bordaCloseUp(Sender: TObject);
begin
  frm_prnf.prnf.PageBorder := cmb_borda.ItemIndex;
  frm_prnf.prnf.PrintDoc;
end;

procedure Tfrm_prnProp.tbmeChange(Sender: TObject);
begin
   edit2.text := inttostr(tbme.position);
   frm_prnf.prnf.MarginLeft :=  trunc(tbme.position);
   frm_prnf.prnf.PrintDoc;
end;

procedure Tfrm_prnProp.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_prnProp.tbmdChange(Sender: TObject);
begin
   edit3.text := inttostr(tbmd.position);

   frm_prnf.prnf.MarginRight :=  trunc(tbmd.position);
   frm_prnf.prnf.PrintDoc;
end;

procedure Tfrm_prnProp.tbmsChange(Sender: TObject);
begin
  edit5.text := inttostr(tbms.position);
  
   frm_prnf.prnf.MarginTop :=  trunc(tbms.position);
   frm_prnf.prnf.PrintDoc;
end;

procedure Tfrm_prnProp.tbmiChange(Sender: TObject);
begin
  edit4.text := inttostr(tbmi.position);

   frm_prnf.prnf.MarginBottom :=  trunc(tbmi.position);
   frm_prnf.prnf.PrintDoc;
end;

procedure Tfrm_prnProp.tbrodChange(Sender: TObject);
begin
   edit1.text := inttostr(tbrod.position);

   frm_prnf.prnf.MarginFooter :=  trunc(tbrod.position);
   frm_prnf.prnf.PrintDoc;
end;

procedure Tfrm_prnProp.tbcabChange(Sender: TObject);
begin
  edit6.text := inttostr(tbcab.position);

   frm_prnf.prnf.MarginHeader :=  trunc(tbcab.position);
   frm_prnf.prnf.PrintDoc;
end;

end.
