program Desbloqueio;

uses
  Forms,
  des_main in 'des_main.pas' {frm_desmain},
  bst_Configdb in 'bst_Configdb.pas' {frm_ConfigDB},
  bstDB in 'bstdb.pas',
  cls_bd in 'cls_bd.pas',
  cls_obj in 'cls_obj.pas',
  DualList in 'C:\Arquivos de programas\Borland\Delphi7\Objrepos\DUALLIST.pas' {DualListDlg},
  pList_Std in 'pList_Std.pas' {frm_pList},
  fonctions in 'fonctions.pas',
  DDSEG in 'DDSEG.pas',
  bst_unit in 'bst_unit.pas',
  bst_main in 'bst_main.pas' {frm_main},
  bst_dm_rel in 'bst_dm_rel.pas' {dm_rel: TDataModule},
  bst_basefrm in 'bst_basefrm.pas' {Basefrm},
  bst_idiomas in 'bst_idiomas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrm_desmain, frm_desmain);
  Application.Run;
end.
