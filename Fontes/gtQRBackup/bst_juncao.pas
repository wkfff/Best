unit bst_juncao;

interface

uses
  Windows, bst_basefrm,Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BST_TELAOBJ, ComCtrls, DBCtrls, ExtCtrls, Menus, ImgList, Mask,
  StdCtrls, Grids, DBGrids, Buttons, ToolWin,cls_obj,AddFlow3Lib_TLB, gtQrCtrls,bstdb,
  OleCtrls, ActnList;

  type
  uLst = ^TLst;
  TLst = record
    dstNode : afNode;
    lnk     : afLink;
    tipo    : char;
end;
type
  Tfrm_juncao = class(Tfrm_obj)
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    dbrg: TDBRadioGroup;
    DBRichEdit1: TDBRichEdit;
    tab_perc: TTabSheet;
    trv_ativ: TTreeView;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure sp2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcpChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Loadconstantobj;override;

  end;

var
  frm_juncao: Tfrm_juncao;
 // mLst : uLst;
implementation

uses bst_main, bst_treeAtiv;

{$R *.dfm}

procedure Tfrm_juncao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frm_juncao := nil;
  action := caFree;
end;

procedure Tfrm_juncao.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_juncao.sp2Click(Sender: TObject);
var
iObj,iUp,iDown : afNode;
s : string;
begin
  inherited;
try
  iObj := tv.diagrama.selectedNode;
  If dbrg.ItemIndex < 0 then
    dbrg.itemIndex := 1;
  if iObj = nil then
   raise exception.create(EI1);
  If iObj.shape = 1 then    // cliquou na parte inferoir da junção
   begin
     iDown := iObj;
     iUp := tv.diagrama.Obtem_JuncUp(iObj)  ;
     If iUp = nil then
        raise exception.create(EI8);
     iObj.Text := dbrg.values[dbrg.itemIndex];
   end
  else      // cliquou na parte superior da junção
   begin
     iuP := iObj;
     iDown := tv.Diagrama.Obtem_Junc(iUp);
   end;

  s := iDown.Text;
  If dbrg.Items[dbrg.ItemIndex][1] <> iDown.Text then
   showmessage (Mens62);
  iDown.Text := dbrg.values[dbrg.itemIndex][1];
  iUp.Text := dbedit2.Text;
  tv.diagrama.selectedNode := iUp;
  If dbrg.ItemIndex = 0 then //and
    Begin
      iUp.Text := '';
      iDown.Text :=  '&&';
      iup.OutLinks.Item(1).Hidden := true;
      iUp.Hidden := true;
      iUp.Top := iDown.Top;
      iup.Left := iDown.left+10;
      iUp.Width  := 0;
      iUp.Height := 0;
      iDown.Selected := true;
    end;

finally
 { If iObj <> nil then
     freeandnil(iObj);
  If iUp <> nil then
     freeandnil(iup);
  If iDown <> nil then
  freeandnil(iDown);}
end;
end;

procedure Tfrm_juncao.FormShow(Sender: TObject);
begin
  inherited;
  //dbrg.ItemIndex := -1;
  
end;

procedure Tfrm_juncao.pgcpChange(Sender: TObject);
var
iList : Tlist;
i : integer;
mList : uLst;
begin
  inherited;
  If pgcp.ActivePage = Tab_Perc then
   Begin
     Trv_Ativ.Items.Clear;
     If frm_treeativ <> nil then
       Begin
        with TDg.create do
         Begin
            iList := Get_Nodes(tv.Diagrama.SelectedNode,'O');
            free;
         end;

        for i := 0 to iList.Count - 1 do
         Begin
          with Tdados_Tab.create(self) do
           Begin
             mList := iList.Items[i];
             Get_Correlato(tv.Diagrama.EMPRESA,tv.Diagrama.CENARIO,'JU',Id,'AP',mList^.dstNode.UserData);
         //    trv_perc.Items.Add(nil,floattostrf(fieldbyname('PERC_CUSTO').asfloat,ffnumber,3,2));
             trv_ativ.Items.Add(nil,floattostrf(fieldbyname('PERC_CUSTO').asfloat,ffnumber,3,2) + def120+mList^.dstNode.Text);
             free;
           end;
         end;
       end;
   end;


end;

procedure Tfrm_juncao.Loadconstantobj;
var
i : integer;

begin
 inherited;
 Caption          := def333;//'Junção' ;
 Label3.Caption   := def10005;//'Nome'   ;
 Label1.Caption   := def39;//'Descrição'  ;
 dbrg.Caption     := defl7;//'Lógica' ;
 dbrg.items[0]    := defe27;// 'E'    ;
 dbrg.items[1]    := defo5;// 'OU'    ;
 tab_perc.Caption := defp17;//'Percentuais de Passagem'  ;
 Label4. Caption  := defp17;//'Para Atividade' ;


end;

end.

