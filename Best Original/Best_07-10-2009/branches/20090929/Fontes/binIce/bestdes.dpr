program bestdes;

{%ToDo 'bestdes.todo'}

uses
  Forms,
  windows,
  dialogs,
  bst_main in 'bst_main.pas' {frm_main},
  cls_bd in 'cls_bd.pas',
  bst_Telastd in 'BST_TELASTD.pas' {frm},
  bstDB in 'bstdb.pas',
  bst_clifull in 'bst_clifull.pas' {frm_clifull},
  bst_logo in 'bst_logo.pas' {frm_logo},
  bst_cenario in 'bst_cenario.pas' {frm_cenario},
  bst_stdcad in 'bst_STDCAD.pas' {frm_stdcad},
  bst_ari in 'bst_ari.pas' {FRM_ARI},
  bst_diversos in 'bst_diversos.pas' {frm_diversos},
  bst_treeAtiv in 'bst_treeativ.pas' {frm_treeativ},
  cls_obj in 'cls_obj.pas',
  bst_text in 'bst_text.pas' {frm_text},
  bst_escli in 'bst_escli.pas' {frm_esccli},
  cls_utils in 'cls_utils.pas',
  bst_images in 'bst_images.pas' {frm_images},
  bst_cfg in 'bst_cfg.pas' {frm_cfg},
  bst_propr in 'bst_propr.pas' {frm_propr},
  bst_proprlink in 'bst_proprlink.pas' {frm_proprlink},
  bst_dirbmp in 'bst_dirbmp.pas' {frm_dirbmp},
  bst_diagrama in 'bst_diagrama.pas' {frm_diag},
  bst_telaObj in 'BST_TELAOBJ.pas' {frm_obj},
  bst_regra in 'bst_regra.pas' {frm_regra},
  bst_en in 'bst_en.pas' {frm_en},
  bst_ca in 'Bst_ca.pas' {frm_ca},
  bst_data in 'bst_data.pas' {frm_data},
  bst_lf in 'bst_lf.pas' {frm_lf},
  bst_se in 'bst_se.pas' {frm_se},
  bst_pessoa in 'bst_pessoa.pas' {frm_pessoa},
  bst_aspectos in 'bst_aspectos.pas' {frm_aspectos},
  bst_dir4 in 'bst_dir4.pas' {frm_dir4},
  bst_if in 'bst_if.pas' {frm_if},
  bst_juncao in 'bst_juncao.pas' {frm_juncao},
  bst_texto in 'bst_texto.pas' {frm_texto},
  bst_conector in 'bst_conector.pas' {frm_conector},
  bst_origem in 'bst_origem.pas' {frm_dados},
  bst_exdir in 'bst_exdir.pas' {frm_exdir},
  bst_objetos in 'bst_objetos.pas' {frm_objetos},
  bst_preprint in 'bst_preprint.pas' {frm_preprint},
  bst_escativ in 'bst_escativ.pas' {FRM_ESCATIV},
  bst_dm_rel in 'bst_dm_rel.pas' {dm_rel: TDataModule},
  bst_cimp in 'bst_cimp.pas' {frm_cimp},
  bst_pregra in 'bst_pregra.pas' {frm_pregra},
  bst_ppessoa in 'bst_ppessoa.pas' {frm_ppessoa},
  bst_puc in 'bst_puc.pas' {frm_puc},
  bst_pse in 'bst_pse.pas' {frm_pse},
  bst_plf in 'bst_plf.pas' {frm_plf},
  bst_Escaspect in 'bst_Escaspect.pas' {frm_escaspect},
  bst_about in 'bst_about.pas' {frm_about},
  bst_treeator in 'bst_treeator.pas' {frm_treeator},
  bst_limpa in 'bst_limpa.pas' {frm_limpa},
  bst_log in 'bst_log.pas' {frm_log},
  bst_dir1 in 'bst_dir1.pas' {frm_diretorio},
  bst_ImpProc in 'bst_ImpProc.pas' {frm_impproc},
  bst_preqtitot in 'bst_preqtitot.pas' {frm_preqtitot},
  bst_Licexport in 'bst_Licexport.pas' {frm_LicExport},
  BST_help in 'BST_help.pas' {frm_help},
  bst_grid in 'bst_grid.pas' {frm_grid},
  bst_bancos in 'bst_bancos.pas' {frm_bancos},
  qcc_enga in 'qcc_enga.pas' {frm_enga},
  bst_tabenga in 'bst_tabenga.pas' {frm_tabenga},
  bst_enc in 'bst_enc.pas' {frm_enc},
  bst_mensagem in 'bst_mensagem.pas' {frm_mensagem},
  bst_preqti in 'bst_preqti.pas' {frm_preqti},
  bst_check in 'bst_check.pas' {frm_check},
  bst_prnprop in 'bst_prnprop.pas' {frm_prnProp},
  bst_prnf in 'bst_prnf.pas' {frm_prnf},
  bst_plista in 'bst_plista.pas' {frm_pLista},
  bst_dmicon in 'bst_dmicon.pas' {frm_dmicon},
  bst_pprint in 'bst_pprint.pas' {frm_pprint},
  bst_perc_custo in 'bst_perc_custo.pas' {frm_perc_custo},
  bst_escFluxos in 'bst_escFluxos.pas' {frm_escFluxos},
  bst_aplic in 'bst_aplic.pas' {frm_aplic},
  bst_treeCusto in 'bst_treecusto.pas' {frm_treeCusto},
  bst_atordef in 'bst_atordef.pas' {frm_atordef},
  bst_icereg in 'bst_icereg.pas' {frm_icerg},
  bst_Configdb in 'bst_Configdb.pas' {frm_ConfigDB},
  bst_selmissao in 'bst_selmissao.pas' {frm_selmissao},
  bst_demoassist in 'bst_demoassist.pas' {frm_demoassist},
  reinit in 'reinit.pas',
  bst_mens in 'bst_mens.pas' {frm_mens},
  bst_enttext in 'bst_enttext.pas' {frm_enttext},
  bst_cs in 'bst_cs.pas' {frm_cs},
  bst_todo in 'bst_todo.pas' {FRM_TODO},
  bst_impdim in 'bst_impdim.pas' {frm_impdim},
  bst_todoger in 'bst_todoger.pas' {FRM_TODOGER},
  bst_ev in 'bst_ev.pas' {frm_ev},
  bst_de in 'bst_de.pas' {frm_de},
  bst_ap in 'bst_ap.pas' {frm_ap},
  DualList in '..\Arquivos De Programas\Borland\Delphi7\Objrepos\DualList.PAS' {DualListDlg},
  About in '..\Arquivos De Programas\Borland\Delphi7\Objrepos\About.pas' {AboutBox},
  bst_escliImport in 'bst_escliImport.pas' {frm_esccliImport},
  cls_codigo in 'cls_codigo.pas',
  bst_unit in 'preprg\bst_unit.pas',
  frm_prim in 'frm_prim.pas' {prim},
  CAD_STD in 'CAD_STD.pas' {CAD_STD},
  BST_PROP in 'BST_PROP.PAS' {FRM_PROP},
  OO_BEST in 'OO_BEST.pas',
  DD_BEST in 'DD_BEST.pas',
  BST_METOD in 'BST_METOD.PAS' {FRM_METOD},
  bst_qry in 'bst_qry.pas' {frm_qry},
  bst_MainPT in 'bst_MainPT.pas',
  bst_resPT in 'bst_resPT.pas',
  bst_basefrm in 'bst_basefrm.pas' {Basefrm},
  bst_ger in 'bst_ger.pas' {frm_ger},
  bst_usuario in 'bst_usuario.pas' {FRM_usuario},
  BST_PERS in 'BST_PERS.pas' {FRM_PERS},
  BST_SEGUC in 'BST_SEGUC.PAS' {FRM_SEGUC},
  frm_primar in 'frm_primar.pas' {primar},
  CAD_STAND in 'cad_stand.pas' {CAD_STAND},
  DDSEG in 'DDSEG.pas',
  OOSEG in 'OOSEG.pas',
  BST_PRIVILEGIO in 'BST_PRIVILEGIO.PAS' {FRM_PRIVILEGIO},
  cl_access2 in 'cl_access2.pas',
  des_main in 'des_main.pas' {frm_desmain},
  basetier in 'basetier.pas',
  db_tier in 'db_tier.pas',
  fonctions in 'fonctions.pas',
  bst_idiomas in 'bst_idiomas.pas',
  AddFlow3Lib_TLB in '..\Arquivos de programas\Borland\Delphi7\Imports\AddFlow3Lib_TLB.pas',
  Frm_RPT in 'Frm_RPT.pas' {Frm_Relatorio},
  ExportaExcel in 'ExportaExcel.pas' {DMExportacaoExcel: TDataModule},
  pList_Std in 'pList_Std.pas' {frm_pList},
  bst_lista in 'bst_lista.pas' {frm_lista},
  bst_dirCenario in 'bst_dirCenario.pas' {frmDirCenarios},
  bst_ValidaBEST in 'bst_ValidaBEST.pas' {ValidaBEST},
  bst_PreviewDiagrama in 'bst_PreviewDiagrama.pas' {frm_DiagramaPreview};

{$R *.res}


begin
 { SetLastError(NO_ERROR);
  CreateMutex (nil, False, 'pm');
  if GetLastError = ERROR_ALREADY_EXISTS then
    Begin
      showmessage('BEST já esta aberto!');
      exit;
    end;  }

   Application.Initialize;
  {If frm_idiomas     = nil then
      frm_idiomas       := Tfrm_idiomas .create(application);
   frm_idiomas .showmodal;    }

  Application.CreateForm(Tdm_rel, dm_rel);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TDualListDlg, DualListDlg);
  Application.CreateForm(TFrm_Relatorio, Frm_Relatorio);
  Application.CreateForm(TDMExportacaoExcel, DMExportacaoExcel);
  Application.CreateForm(Tfrm_pList, frm_pList);
  Application.CreateForm(Tfrm_lista, frm_lista);
  Application.CreateForm(TfrmDirCenarios, frmDirCenarios);
  Application.CreateForm(TValidaBEST, ValidaBEST);
  Application.CreateForm(Tfrm_DiagramaPreview, frm_DiagramaPreview);
  aPplication.Run;
end.
