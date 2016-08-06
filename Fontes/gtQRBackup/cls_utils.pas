unit cls_utils;

interface
uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ExtCtrls,ComCtrls,menus, strutils,forms,DBgrids,
  dbctrls,bstdb,QuickRpt, Qrctrls,DB,cls_obj, gtQrCtrls, ADODB;

     function  Locate_data (pList : TObject; ptext : string) : TObject;
     procedure xBullet(pForm : TForm; pButton : TtoolButton);
     procedure xFont(pForm : TForm;pFont : TfontDialog);
     procedure xBold(pForm : TForm; pButton : TtoolButton);
     procedure xCopy(pForm : TForm);
     procedure xPaste(pForm : TForm);
     procedure xItalic(pForm : TForm; pButton : TtoolButton);
     procedure xUnderLine(pForm : TForm; pButton : TtoolButton);
     procedure xAlign(pForm : TForm; sender : TObject);
     procedure sChange(pForm : TForm; pBoldButton : TtoolButton;
                            pItalicButton : TtoolButton;
                            pUnderLineButton : TtoolButton;
                            pFont : TFontDialog);
     function CurrText(pEditor : TDBRichedit) : TTextAttributes;
     procedure xpand(pForm : TForm; pMemo : TControl);
     procedure Desabilita(pForm : TForm); // reaOnly nos controles(viewer)
     function qrdataset(pqr : TObject; pDataset : Tdataset) : boolean; // aloca dataset aos controle do quickreport
     function Get_Nomcli (pNode : TTReeNode) : string; // pega o nome do cliente no treeview
     function Get_NomProj (pNode : TTReeNode) : string; // pega o nome do projeto no treeview
     //function  Mostra_lista (pCli,pProj: integer;pDim,pTit : string;pTag : integer;
     //                  pEdit : Boolean;pTree : TTreeView;pId : integer) : string;
     //pesquisa bancos de dados
     function Procura_Bancos(pDir : boolean; pTipo_banco : integer;pTab : string) : TAdoConnection;
     
resourcestring
mensutil1   = 'Erro interno : Locate_data ->plist = nil';

var
Editor : TDBRichEdit;
mWidth,mHeight,mTop,mLeft : integer;
codigo_lista,Desc_lista ,Nom_cli: string;
idbext : TadoConnection;

implementation

uses bst_lista, bst_dir4,  bst_MainPT, bst_dir1;


function Get_Nomcli (pNode : TTReeNode) : string; // pega o nome do cliente no treeview

begin
   If pNode <> nil then
    begin
      If pNode.parent = nil then
         Begin
           Nom_cli := udado(pNode.data)^.fNome ;
           exit;
         end         
      else
         Get_NomCli(pNode.parent);
    end;
    result := Nom_cli;
end;



function Get_NomProj (pNode : TTReeNode) : string; // pega o nome do projeto no treeview

begin
   If pNode <> nil then
    begin
      If pNode.Level = 1 then
         Begin
            Nom_Cli := udado(pNode.data)^.fNome  ;
            exit;
         end
        
      else
      If pNode.Level < 1  then
       exit
      else
        Get_NomProj(pNode.parent);
    end;
    result := Nom_Cli;
end;

function Procura_Bancos(pDir : boolean; pTipo_banco : integer;pTab : string) : TAdoConnection;
var
dir_db : string;
Begin
 { Result := nil;
  case pTipo_Banco of
   0,1,2 : Begin
             If pDir then
               Begin
                 If frm_dir4 = nil then
                    frm_dir4 := Tfrm_dir4.create(application);
               end;
           end;
  4 :
  end;

  case pTipo_banco of
   0 : Begin
         If pDir then
          Begin

            frm_dir4.fl.Mask := '*.mdb';
            frm_dir4.ShowModal;
          end;
         iDbext.connected        := false;
         iDbext.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Dir_db+';Persist Security Info=False';
         iDBado := idbExt;

       end;
   1 : Begin
         If pDir then
          Begin

            frm_dir4.fl.Mask := '*.db';
            frm_dir4.ShowModal;
            dir_db := Diretorio;
          end;
         iDbParadox.connected        := false;
         idbParadox.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Diretorio+';Extended Properties=Paradox 7.x;Persist Security Info=False';
         IdbAdo := iDbParadox;
       end;

   2 : Begin         //dbase
         If pDir then
          Begin

            frm_dir4.fl.Mask := '*.dbf';
            frm_dir4.ShowModal;
            dir_db := Diretorio;
          end;
         iDbDbase.connected        := false;
         idbDbase.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+Diretorio+';Extended Properties=Dbase III;Persist Security Info=False';
         IdbAdo := iDbDbase;
       end;

   3 : Begin      //SQL SERVER
        IdbSqlserver.connected := false;
        idbSQLServer.ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+NOME_BANCO+';Data Source='+SERVIDOR;
        IdbAdo := IdbSqlserver;
       end;

   4: Begin     //INFORMIX
        IdbInformix.connected := false;
        IdbInformix.ConnectionString := 'Provider=Ifxoledbc.2;Persist Security Info=False;Data Source='+NOME_BANCO+'@'+SERVIDOR;
       // idbSQLServer.ConnectionString := 'Provider=SQLOLEDB.1;Persist Security Info=False;Initial Catalog='+NOME_BANCO+';Data Source='+SERVIDOR;
        IdbAdo := IdbInformix;
       end;
  end;

  result := IdbAdo;
  frm_bANCOS.CLOSE; }
end;

//function Locate_data (pList :TTreeView; ptext : string) : TTreeNode;
function Locate_data (pList : TObject; ptext : string) : TObject;
var
i,l : integer;
  begin
    result := nil;

    l := length(ptext);
    try
     begin
      If plIst = nil then
         raise exception.create(MensUtil1);
     end;
    except
     begin
       raise;
     end;
    end;

    If pList is TTReeview then
    begin
      for i := 0 to (pList as TTReeView).Items.Count -1 do
        begin
           If uppercase(leftstr((pList as TTReeView).items[i].Text,length(trim(ptext)))) = uppercase(ptext) then
              begin
                 result := (pList as TTReeView).items[i];
                 break;
              end; 
        end;
      end
    else
     begin
      for i := 0 to (pList as TListBox).Items.Count -1 do
        begin
           If uppercase(leftstr((pList as TListBox).items[i],length(trim(ptext)))) = uppercase(ptext) then
              begin
                 result := pList ;
                 break;
              end;

        end;
      end;
  end;

procedure xBullet(pForm : TForm; pButton : TtoolButton);
begin

If Uppercase(pForm.ActiveControl.ClassName) = 'TDBRICHEDIT' then
         TDBRichEdit(pForm.ActiveControl).DataSource.DataSet.edit
  else

  If (Uppercase(pForm.ActiveControl.ClassName) = 'TRICHEDIT')  then
  
  else
     exit;

  TRichEdit(pForm.ActiveControl).Paragraph.Numbering := TNumberingStyle(pButton.Down);
end;


procedure xFont(pForm : TForm;pFont : TfontDialog);
var
i : integer;
begin

If (Uppercase(pForm.ActiveControl.ClassName) = 'TDBRICHEDIT') or
   (Uppercase(pForm.ActiveControl.ClassName) = 'TRICHEDIT')  then
   begin
      Editor := TDBRichEdit(pForm.ActiveControl) ;
      if pFont.execute then
         Begin
           CurrText(Editor).Name        := pFont.Font.Name;
           CurrText(Editor).size        := pFont.Font.size;
           CurrText(Editor).Charset     := pFont.Font.Charset;
           CurrText(Editor).Color       := pFont.Font.Color ;
           CurrText(Editor).Pitch       := pFont.Font.Pitch;
           CurrText(Editor).Style       := pFont.Font.Style;
           CurrText(Editor).Height      := pFont.Font.Height;
         end;

   end
else
If Uppercase(pForm.ActiveControl.ClassName) = 'TDBGRID' then
   Begin
     if pFont.Execute then
      begin
     // If TDBGrid(pForm.ActiveControl).SelectedRows.Count = 0 then
         TDBGrid(pForm.ActiveControl).font := pFont.font    ;
   {   else
         begin
           for i := 0 to TDBGrid(pForm.ActiveControl).SelectedRows.Count - 1 do
            begin
             with  TDBGrid(pForm.ActiveControl).DataSource.DataSet do
              begin
                   GotoBookmark(pointer(TDBGrid(pForm.ActiveControl).SelectedRows.Items[i]));
                   TDBGrid(pForm.ActiveControl).Canvas.Font.Color := clred;

              end;



            end;

         end; }

      end;

   end
else

If Uppercase(pForm.ActiveControl.ClassName) = 'TDBEDIT' then
   Begin
     if pFont.Execute then
      Begin
      {TDbedit(pForm.ActiveControl).Font.Name :=  pFont.Font.Name;
      TDbedit(pForm.ActiveControl).font.size        := pFont.Font.size;
      TDbedit(pForm.ActiveControl).font.Charset     := pFont.Font.Charset;
      TDbedit(pForm.ActiveControl).font.Color       := pFont.Font.Color ;
      TDbedit(pForm.ActiveControl).font.Pitch       := pFont.Font.Pitch;
      TDbedit(pForm.ActiveControl).font.Style       := pFont.Font.Style;
      TDbedit(pForm.ActiveControl).font.Height      := pFont.Font.Height; }
      
      end;
     
   end
else

   exit;
end;

procedure xCopy(pForm : TForm);
begin
 If Uppercase(pForm.activeControl.ClassName) = 'TRICHEDIT' then
       TRICHEDIT(pForm.activeControl).COPYTOCLIPBOARD
   else
 If Uppercase(pForm.activeControl.ClassName) = 'TMEMO' then
    TMEMO(pForm.activeControl).COPYTOCLIPBOARD
 ELSE
If Uppercase(pForm.activeControl.ClassName) = 'TDBRICHEDIT' then
       TDBRICHEDIT(pForm.activeControl).COPYTOCLIPBOARD
else
     exit;
end;

procedure xPaste(pForm : TForm);
begin
 If Uppercase(pForm.activeControl.ClassName) = 'TRICHEDIT' then
       TRICHEDIT(pForm.activeControl).PASTEFROMCLIPBOARD
   else
If Uppercase(pForm.activeControl.ClassName) = 'TDBRICHEDIT' then
       TDBRICHEDIT(pForm.activeControl).PASTEFROMCLIPBOARD
else
 If Uppercase(pForm.activeControl.ClassName) = 'TMEMO' then
    TMEMO(pForm.activeControl).PASTEFROMCLIPBOARD
 ELSE
     exit;
end;

procedure xBold(pForm : TForm; pButton : TtoolButton);
begin

If Uppercase(pForm.ActiveControl.ClassName) = 'TDBRICHEDIT' then
  Begin
   TDBRichEdit(pForm.ActiveControl).DataSource.DataSet.edit;
   if pButton.Down then
    CurrText(TDBRichEdit(pForm.ActiveControl)).Style := CurrText(TDBRichEdit(pForm.ActiveControl)).Style + [fsBold]
  else
    CurrText(TDBRichEdit(pForm.ActiveControl)).Style := CurrText(TDBRichEdit(pForm.ActiveControl)).Style - [fsBold] ;
    exit;
  end ;


end;

procedure xItalic(pForm : TForm; pButton : TtoolButton);
begin
If Uppercase(pForm.ActiveControl.ClassName) = 'TDBRICHEDIT' then
   begin
     TDBRichEdit(pForm.ActiveControl).DataSource.DataSet.edit;
     //TDBRichEdit(pForm.ActiveControl).Text :=  TDBRichEdit(pForm.ActiveControl).Text +' ';
    // Editor := TDBRichEdit(pForm.ActiveControl);
   end

  else
     exit;
  if pButton.Down then
    CurrText(TDBRichEdit(pForm.ActiveControl)).Style := CurrText(TDBRichEdit(pForm.ActiveControl)).Style + [fsItalic]
  else
    CurrText(TDBRichEdit(pForm.ActiveControl)).Style := CurrText(TDBRichEdit(pForm.ActiveControl)).Style - [fsItalic];
end;

procedure xUnderLine(pForm : TForm; pButton : TtoolButton);
begin
If Uppercase(pForm.ActiveControl.ClassName) = 'TDBRICHEDIT' then
   begin
     TDBRichEdit(pForm.ActiveControl).DataSource.DataSet.edit;
    // TDBRichEdit(pForm.ActiveControl).Text :=  TDBRichEdit(pForm.ActiveControl).Text +' ';
    // Editor := TDBRichEdit(pForm.ActiveControl);
   end
  else
     exit;
  if pButton.Down then
    CurrText(TDBRichEdit(pForm.ActiveControl)).Style := CurrText(TDBRichEdit(pForm.ActiveControl)).Style + [fsUnderline]
  else
    CurrText(TDBRichEdit(pForm.ActiveControl)).Style := CurrText(TDBRichEdit(pForm.ActiveControl)).Style -  [fsUnderline];
end;

procedure xAlign(pForm : TForm; sender : TObject);
begin
If Uppercase(pForm.ActiveControl.ClassName) = 'TDBRICHEDIT' then
   TDBRichEdit(pForm.ActiveControl).DataSource.DataSet.edit
  else
     exit;

  TRichEdit(pForm.ActiveControl).Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure sChange(pForm : TForm; pBoldButton : TtoolButton;
                            pItalicButton : TtoolButton;
                            pUnderLineButton : TtoolButton;
                            pFont : TFontDialog);
begin
    If pForm.ActiveControl is TDBRichEdit then
       Editor := TDBRichedit(pForm.ActiveControl) ;
    pBoldButton.Down := fsBold in Editor.SelAttributes.Style;
    pItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    pUnderlineButton.Down := fsUnderline in Editor.SelAttributes.Style;
    //BulletsButton.Down := Boolean(Numbering);
    //FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    //FontName.Text := Editor.SelAttributes.Name;  }
    Editor.SelAttributes.Charset := pFont.Font.Charset;
    Editor.SelAttributes.Color   := pFont.Font.Color;
    Editor.SelAttributes.Size    := pFont.Font.Size;
    Editor.SelAttributes.Style   := pFont.Font.Style;
end;

function CurrText(pEditor : TDBRichedit) : TTextAttributes;
begin
  if pEditor.SelLength > 0 then
     Result := pEditor.SelAttributes
  else
     Result := pEditor.DefAttributes;


end;

procedure xpand(pForm : TForm; pMemo : Tcontrol);
Begin
  If pmemo.align = alClient then
     Begin
        pmemo.align  := alNone;
        pmemo.width  := mWidth  ;
        pmemo.Height := mHeight  ;
        pmemo.Top    := mTop ;
        pmemo.Left   := mLeft;
     end
  else
     Begin
       mWidth        := pmemo.width;
       mHeight       := pmemo.Height;
       mTop          := pmemo.Top;
       mLeft         := pmemo.Left;
       pmemo.align   := alClient;
       pmemo.bringtoFront;
     end;
end;

procedure Desabilita(pForm : TForm);
var
i ,j: integer;
nom : string;
Wclass : Tclass;
begin

  With pForm do
   begin
      nom := pForm.Name;
       for i:= 0 to pForm.ComponentCount-1  do
       begin
         If Components[i] is TDbedit then
            (components[i] as TDbedit).readOnly := true
         else
         If Components[i] is TDbRichEdit then
            (components[i] as TDbRichEdit).readOnly := true
          else
         If Components[i] is TDbmemo then
            (components[i] as TDbMemo).readOnly := true
         else
         If Components[i] is TComboBox then
            (components[i] as TComboBox).enabled := false
         else
         If Components[i] is TDbLookUpComboBox then
            (components[i] as TDbLookUpComboBox).enabled := false
         else
         If Components[i] is TdateTimePicker then
            (components[i] as TdateTimePicker).enabled := false
         else
         If Components[i] is TRadioGroup then
            (components[i] as TRadioGroup).enabled := false 
         else
         If Components[i] is TDbGrid then
            (components[i] as TDbgrid).options := [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgCancelOnExit];  

            
      end;
   end;

end;

function qrdataset(pqr : TObject; pDataset : Tdataset) : boolean;
var
i : integer;
begin
If pqr is Tqrband then
 begin
   for i  := 0 to (pqr as Tqrband).ControlCount - 1 do
      begin
       If (pqr as Tqrband).controls[i] is TgtQRDBText then
          ((pqr as Tqrband).controls[i] as TgtQRDBText).dataset := pdataset
       else
       If (pqr as Tqrband).controls[i] is TgtQRDBRichText then
          ((pqr as Tqrband).controls[i] as TgtQRDBRichText).dataset := pdataset
       else   

       If (pqr as Tqrband).controls[i] is TgtQRDBRichText then
          ((pqr as Tqrband).controls[i] as TgtQRDBRichText).dataset := pdataset;

      end;
 end
else
If pqr is TqrChildband then
 begin
   for i  := 0 to (pqr as TqrChildband).ControlCount - 1 do
      begin
       If (pqr as TqrChildband).controls[i] is TgtQRDBText then
          ((pqr as TqrChildband).controls[i] as TgtQRDBText).dataset := pdataset
       else
       If (pqr as TqrChildband).controls[i] is TgtQRDBRichText then
          ((pqr as TqrChildband).controls[i] as TgtQRDBRichText).dataset := pdataset;
      end;
 end
else
If pqr is TqrSubDetail then
 begin
   (pqr as TqrSubDetail).DataSet := pDataset;
   for i  := 0 to (pqr as TqrSubDetail).ControlCount - 1 do
      begin
       If (pqr as TqrSubDetail).controls[i] is TgtQRDBText then
          ((pqr as TqrSubDetail).controls[i] as TgtQRDBText).dataset := pdataset
       else
       If (pqr as TqrSubDetail).controls[i] is TgtQRDBRichText then
          ((pqr as TqrSubDetail).controls[i] as TgtQRDBRichText).dataset := pdataset;
      end;
 end
else
If pqr is TqrGroup then
 begin
  // (pqr as TqrGroup).DataSet := pDataset;
   for i  := 0 to (pqr as TqrGroup).ControlCount - 1 do
      begin
       If (pqr as TqrGroup).controls[i] is TgtQRDBText then
          ((pqr as TqrGroup).controls[i] as TgtQRDBText).dataset := pdataset
       else
       If (pqr as TqrGroup).controls[i] is TgtQRDBRichText then
          ((pqr as TqrGroup).controls[i] as TgtQRDBRichText).dataset := pdataset;
      end;
 end  ;

end;
end.
